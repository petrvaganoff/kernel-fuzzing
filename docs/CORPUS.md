# Corpus

You can download corpora from the public syzbot GCS bucket:

```
https://storage.googleapis.com/syzkaller/corpus/<instance-name>-corpus.db
```

- You cannot see the list of files in the bucket, so you need to know the file name before you download it.
- You can find `<instance-name>` on the syzbot instances dashboard:
  https://syzkaller.appspot.com/upstream.
- The corpora are updated every day.
- There are corpora for different platforms (Android and others).
- To check that a file exists: `curl -sI <url>`.

## Useful corpora

| Instance | Size | What it is for |
|---|---|---|
| `ci-upstream-kasan-gce-root` | 139 MB | main upstream x86_64, root - **default base** |
| `ci-upstream-kasan-gce` | 38 MB | upstream, without root |
| `ci-snapshot-upstream-root` | 240 MB | the biggest one (snapshot mode) |
| `ci-upstream-linux-next-kasan-gce-root` | 149 MB | linux-next |
| `ci-upstream-gce-leak` | 120 MB | kmemleak |
| `ci2-upstream-kcsan-gce` | 36 MB | KCSAN |
| `ci-upstream-net-kasan-gce` | 23 MB | network |
| `ci-upstream-bpf-kasan-gce` | 22 MB | bpf |
| `ci2-upstream-fs` | 75 MB | file systems |
| `ci2-linux-6-6-kasan` | 110 MB | LTS 6.6 |
| `ci2-linux-6-1-kasan` | 124 MB | LTS 6.1 |
| `ci2-linux-5-15-kasan` | 150 MB | LTS 5.15 |
| `ci-upstream-gce-arm64` | 38 MB | arm64 |
| `ci-upstream-kasan-gce-386` | 43 MB | i386 |

## How to use

```bash
base_url=https://storage.googleapis.com/syzkaller/corpus
wget $base_url/ci-upstream-kasan-gce-root-corpus.db

# merge into one corpus and put it in workdir before you start syz-manager
./bin/syz-db merge workdir/corpus.db ci-upstream-kasan-gce-root-corpus.db ci2-linux-6-6-kasan-corpus.db
```

## Things to know
- GCE (Google Compute Engine) is the virtual machine service in Google Cloud. These corpora were made by fuzzing on Google's virtual machines. They are a little different from KVM/QEMU virtual machines, but usually this does not matter much.
- Your syzkaller should be close to the latest master version. If a program uses syscall descriptions that your syzkaller does not support, it is thrown away.
- When the manager starts, it checks the whole corpus (triage). This takes a few hours. Programs that give no coverage on your kernel are removed.
- The public corpus does not cover your own modules and syscalls. You can only build a corpus for them by fuzzing them yourself.
- It is still a good idea to back up your own `workdir/corpus.db` regularly.
