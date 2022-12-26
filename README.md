# 🔖 Ответ на практическую работу модуля B 11.5

---

### 📝 пояснения к решению

  1. Используя terraform, разворачиваю ВМ в яндекс облаке, на которой в дальнейшем будет крутиться jenkins
  2. Используя плейбук ansible, устанавливаю на созданную ВМ git, java, docker и jenkins *(изначально была задумка развернуть jenkins в docker, но в дальнейшем от этой идеи отказался, поняв всю "прелесть" отсутсвия mysql клиента в поставляемом области, а также совершив несколько неуспешных "плясок с бубном", пытаясь прикрутить к проекту плагин SQLPlus)*.
  3. В jenkins создаю вспомогательный pipeline (/jenkins/home/pipeline-prebuild), который создает директорию, куда будет склонирован репозиторий, а также клонирует репозиторий с GitHub. Вспомогательный pipeline не связан с проектом и собран вручную *(знаю, что это костыль и есть более изящные решения, например, сделать все это в том же плейбуке (или наверняка есть еще более изящные решения), но было интересно "поковырять" jenkins)*
  4. Основной pipeline (/jenkins/home/pipeline-main) пулит с гитхаб изменения и выполняет sql-скрипт
  5. Основной pipeline связан с github проектом, на github добавлен соответсвующий вебхук с триггером на push

---

### 🖍️ ну и собственно демострация работы самого триггера

```
Started on Dec 26, 2022, 3:56:03 PM
Started by event from 140.82.115.242 ⇒ http://158.160.47.185:8080/github-webhook/ on Mon Dec 26 15:56:03 UTC 2022
Using strategy: Default
[poll] Last Built Revision: Revision d92e6790c5be017f3a82477813f0c9eff80df26f (refs/remotes/origin/develop)
The recommended git tool is: NONE
using credential e80ef8e8-ad5d-49f7-ad7d-378a23e5cf8d
 > git --version # timeout=10
 > git --version # 'git version 1.8.3.1'
using GIT_SSH to set credentials Github
[INFO] Currently running in a labeled security context
[INFO] Currently SELinux is 'enforcing' on the host
 > /usr/bin/chcon --type=ssh_home_t /tmp/jenkins-gitclient-ssh12925723504898452737.key
Verifying host key using known hosts file
You're using 'Known hosts file' strategy to verify ssh host keys, but your known_hosts file does not exist, please go to 'Manage Jenkins' -> 'Configure Global Security' -> 'Git Host Key Verification Configuration' and configure host key verification.
 > git ls-remote -h https://github.com/SergeyErshov/b11-5.git # timeout=10
Found 1 remote heads on https://github.com/SergeyErshov/b11-5.git
[poll] Latest remote head revision on refs/heads/develop is: 61cb2224fb2e0b157678e57be4eaacc364be2e24
Done. Took 0.46 sec
Changes found
```

а также вывод консоли (частично):  

```
RF00005	CM000250.2	8615663	8615731
RF00005	CM000250.2	21741069	21741001
RF00005	CM000250.2	8556718	8556650
RF00005	CM000250.2	8996712	8996644
RF00005	CM000250.2	50528677	50528609
RF00005	CM000250.2	6518261	6518193
RF00005	CM000250.2	6997605	6997673
RF00005	CM000250.2	33044305	33044237
RF00005	CM000250.2	53840205	53840137
RF00005	CM000250.2	6397250	6397182
RF00005	CM000250.2	30505407	30505475
RF00005	CM000250.2	16695438	16695370
RF00005	CM000250.2	10233460	10233528
RF00005	CM000250.2	9297210	9297142
RF00005	CM000250.2	19329992	19329924
RF00005	CM000250.2	11650374	11650306
RF00005	CM000250.2	2245807	2245875
RF00005	CM000250.2	7082785	7082717
RF00005	CM000250.2	54728853	54728921
RF00005	CM000250.2	54168778	54168846
RF00005	CM000250.2	19759233	19759301
RF00005	CM000250.2	30537135	30537067
RF00005	CM000250.2	8277349	8277281
RF00005	CM000250.2	7839164	7839096
RF00005	CM000250.2	882394	882462
RF00005	CM000250.2	2307922	2307984
RF00005	CM000250.2	9002732	9002800
RF00005	CM000250.2	10828627	10828689
RF00005	CM000250.2	9471384	9471452
RF00005	CM000250.2	9874377	9874448
RF00005	CM000250.2	2686157	2686225
RF00005	CM000250.2	6374915	6374847
RF00005	CM000250.2	18915287	18915219
RF00005	CM000250.2	53189335	53189403
RF00005	CM000250.2	12090342	12090274
RF00005	CM000250.2	12255644	12255576
RF00005	CM000250.2	4173070	4173132
RF00005	CM000250.2	8067562	8067630
```
