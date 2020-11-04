alias TodoApi.Repo
alias TodoApi.Schema.Todo

Repo.insert!(%Todo{id: 1001, text: "uno"})
Repo.insert!(%Todo{id: 1002, text: "due"})
Repo.insert!(%Todo{id: 1003, text: "tre"})
