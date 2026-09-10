# Labs de OpenShift / Platform Engineering

## Lab 01 — Cluster e ambientes
Suba o OpenShift Local, faça login com `oc` e execute `scripts/setup-openshift-local.sh`. Valide os projects TI, HML e PROD.

## Lab 02 — Deploy TI
Construa uma imagem da aplicação, disponibilize-a para o cluster e execute `scripts/deploy.sh ti`. Valide Pod, Deployment, Service e Route.

## Lab 03 — Promoção HML
Use exatamente a mesma tag de imagem de TI e faça deploy em HML. Compare ConfigMap, replicas, Route e eventos.

## Lab 04 — PROD com aprovação
Simule a aprovação manual da pipeline e promova a mesma imagem para PROD. Observe que PROD usa duas réplicas.

## Lab 05 — CrashLoopBackOff
Altere temporariamente o comando/container para uma configuração inválida. Investigue com `oc get pods`, `oc describe pod` e `oc logs`.

## Lab 06 — Readiness quebrada
Troque `/health` por `/health-error`. Observe Pod Running porém não Ready. Investigue Service endpoints e eventos.

## Lab 07 — Route quebrada
Altere o `targetPort` ou o Service referenciado pela Route. Descubra por que a aplicação está saudável internamente mas indisponível externamente.

## Lab 08 — Default vs Custom
Troque o include de `default-pipeline.yml` por `custom-pipeline.yml`. Identifique o que foi herdado e o que foi sobrescrito.

## Mental model de troubleshooting
`Pipeline -> Image -> Manifest -> Deployment -> ReplicaSet -> Pod -> Readiness -> Service -> Endpoints -> Route`

Não copie artefatos internos de ambiente corporativo para este laboratório. Reproduza apenas conceitos com dados fictícios.
