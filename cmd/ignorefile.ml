open Cmdliner

let string_of_file filename =
  let ch = open_in_bin filename in
  let len = in_channel_length ch in
  let s = really_input_string ch len in
  close_in_noerr ch ; s

let file =
  let doc = "The ignore file to check" in
  Arg.(required & pos 0 (some non_dir_file) None & info [] ~docv:"FILE" ~doc)

let check filename =
  let s = string_of_file filename in
  let incidents = Ignorefilelib.check ~filename s in
  match incidents with
  | [] ->
      ()
  | incidents ->
      Format.fprintf Format.err_formatter "%a@." Report.pp_incidents incidents ;
      exit 1

let cmd =
  let doc = "Enforce ignore patterns in ignore files" in
  ( Term.(const check $ file)
  , Term.info "ignorefile" ~doc ~exits:Term.default_exits )

let () = Term.(exit @@ eval ~catch:false cmd)
