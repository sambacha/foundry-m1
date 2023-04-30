# foundry m1 binaries 

> performant foundry binaries for apple m1 using `ld64.lld`

#### version methods

| Method                   | Input              | Output             |
|--------------------------|--------------------|--------------------|
| `major`                  | `1.2.3-a45,ccdd88` | `1`                |
| `minor`                  | `1.2.3-a45,ccdd88` | `2`                |
| `patch`                  | `1.2.3-a45,ccdd88` | `3-a45`            |
| `major_minor`            | `1.2.3-a45,ccdd88` | `1.2`              |
| `major_minor_patch`      | `1.2.3-a45,ccdd88` | `1.2.3-a45`        |
| `minor_patch`            | `1.2.3-a45,ccdd88` | `2.3-a45`          |
| `before_comma`           | `1.2.3-a45,ccdd88` | `1.2.3-a45`        |
| `after_comma`            | `1.2.3-a45,ccdd88` | `ccdd88`           |
| `dots_to_hyphens`        | `1.2.3-a45,ccdd88` | `1-2-3-a45,ccdd88` |
| `no_dots`                | `1.2.3-a45,ccdd88` | `123-a45,ccdd88`   |
Similar to `dots_to_hyphens`, we provide all logical permutations of `{dots,hyphens,underscores}_to_{dots,hyphens,underscores}`. The same applies to `no_dots` in the form of `no_{dots,hyphens,underscores}`, with an extra `no_dividers` that applies all of those at once.
Finally, there is `csv` that returns an array of comma-separated values. `csv`, `before_comma` and `after_comma` are extra special to allow for otherwise complex cases, and should be used sparingly. There should be no more than two of `,` per `version`.


#### Git URLs

Artifacts also may be distributed via git repositories. URLs that end in `.git` are automatically assumed to be git repositories, and the following key/value pairs may be appended to `url`:

| key                | value       |
| ------------------ | ----------- |
| `using:`           | the symbol `:git` is the only legal value
| `tag:`             | a string identifying the git tag to download
| `revision:`        | a string identifying the git revision to download
| `branch:`          | a string identifying the git branch to download
| `only_path:`       | a path within the repository to limit the checkout to. If only a single directory of a large repository is required, using this option can signficantly speed up downloads. If provided, artifact paths are relative to this path.
