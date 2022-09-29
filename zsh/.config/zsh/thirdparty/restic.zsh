local repo_file=$HOME/.restic/repo
local exclude_file=$HOME/.restic/excludes
local include_file=$HOME/.restic/files

restic_backup () {
  restic backup --repository-file=$repo_file \
    --files-from=$include_file \
    --exclude-file=$exclude_file \
    --verbose 
}

restic_forget () {
  restic forget --repository-file=$repo_file \
    --host $(hostname) \
    --prune \
    --keep-within=$1 \
    --verbose
}

restic_du () {
  restic stats --repository-file=$repo_file \
    --mode raw-data \
    --verbose
}
