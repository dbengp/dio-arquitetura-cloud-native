# dio-arquitetura-cloud-native
## Construção de uma Aplicação de Aluguel de Carros totalmente Cloud-Native

### Os conceitos e resumo foram retirados da leitura das documentações oficiais:
- <https://learn.microsoft.com/pt-br/cloud-computing/>
- <https://learn.microsoft.com/pt-br/azure/cloud-adoption-framework/>
- <https://learn.microsoft.com/pt-br/azure/well-architected/>

### Aplicações Cloud Native: 
- A computação em nuvem transformou a forma como as empresas desenvolvem, implantam e gerenciam software. Dentro dessa evolução, as aplicações cloud native representam um paradigma que leva ao máximo as vantagens da nuvem, buscando otimização, escalabilidade, resiliência e agilidade. Uma aplicação totalmente cloud native é aquela que é concebida, projetada e construída desde o início para operar exclusivamente em um ambiente de nuvem, aproveitando ao máximo seus serviços e arquiteturas distribuídas. Para entender a profundidade das aplicações cloud native, é crucial explorar os princípios e tecnologias que as fundamentam:
  * Microsserviços: Em vez de uma única aplicação monolítica, as aplicações cloud native são decompostas em pequenos serviços independentes e fracamente acoplados, cada um responsável por uma funcionalidade específica. Essa modularidade permite que os serviços sejam desenvolvidos, implantados e escalados de forma independente.
  * Contêineres: A padronização do empacotamento de aplicações e suas dependências em contêineres (Docker sendo o mais popular) é um pilar. Os contêineres garantem consistência entre diferentes ambientes (desenvolvimento, teste, produção) e facilitam a portabilidade.
  * Orquestração de Contêineres (Kubernetes): Gerenciar centenas ou milhares de contêineres manualmente é inviável. Plataformas de orquestração como o Kubernetes automatizam o deployment, escalonamento, balanceamento de carga e recuperação de falhas dos contêineres, tornando a operação em larga escala factível.
  * APIs Robustas: A comunicação entre microsserviços é predominantemente feita via APIs bem definidas (RESTful, gRPC). Isso promove a interoperabilidade e a reutilização de serviços.
  * Dados Desacoplados (Bancos de Dados para Cada Serviço): Cada microsserviço tende a ter seu próprio armazenamento de dados, o que evita gargalos e permite a escolha do banco de dados mais adequado para a necessidade específica daquele serviço (poliglota persistência).
  * Gerenciamento de Estado Distribuído: Lidar com estado em um ambiente distribuído exige estratégias como cache distribuído, filas de mensagens e bancos de dados NoSQL.
  * CI/CD (Integração Contínua/Entrega Contínua): A automação do pipeline de desenvolvimento, desde a codificação até a implantação em produção, é essencial. Isso permite releases rápidas e frequentes.
  * Observabilidade: Capacidade de monitorar, rastrear e depurar a aplicação em tempo real. Isso inclui logging centralizado, métricas detalhadas e tracing distribuído, cruciais para identificar e resolver problemas em sistemas complexos.
  * Resiliência e Tolerância a Falhas: As aplicações cloud native são projetadas para falhar gracefully. Isso envolve a implementação de padrões como circuit breakers, retries com backoff exponencial e bulkheads para isolar falhas.
  * Automação Completa: Quase todos os aspectos da infraestrutura e do ciclo de vida da aplicação são automatizados, desde o provisionamento de recursos (Infraestrutura como Código) até a recuperação de desastres.
- Vantagens de adotar uma abordagem totalmente cloud native são numerosas e impactantes:
  * Escalabilidade Elástica e Horizontal: A capacidade de escalar serviços individualmente, adicionando mais instâncias conforme a demanda, otimiza o uso de recursos e garante a performance mesmo em picos de tráfego.
  * Agilidade e Velocidade de Desenvolvimento: A arquitetura de microsserviços e os pipelines de CI/CD permitem que equipes independentes desenvolvam e deployem funcionalidades de forma autônoma e rápida, acelerando o time-to-market.
  * Resiliência e Alta Disponibilidade: A natureza distribuída e a tolerância a falhas inerente aos padrões cloud native garantem que a aplicação possa resistir a falhas de componentes sem interrupção de serviço.
  * Otimização de Custos: Embora o investimento inicial possa ser significativo, a elasticidade e a otimização do uso de recursos da nuvem levam a custos operacionais mais eficientes no longo prazo, pagando apenas pelo que é consumido.
  * Inovação Acelerada: A flexibilidade e a modularidade da arquitetura permitem experimentar novas tecnologias e funcionalidades com menor risco.
  * Manutenibilidade Simplificada: A menor complexidade de cada microsserviço individual facilita a manutenção e a identificação de problemas.
  * Portabilidade: A abstração fornecida por contêineres e Kubernetes oferece um grau significativo de portabilidade entre diferentes provedores de nuvem ou até mesmo para ambientes on-premises (nuvem híbrida).
- Apesar dos benefícios, a transição e a operação de aplicações totalmente cloud native não são isentas de desafios:
  * Complexidade Distribuída: Gerenciar um sistema composto por dezenas ou centenas de microsserviços introduz uma complexidade operacional e de depuração significativamente maior.
  * Monitoramento e Observabilidade: Coletar, correlacionar e analisar logs, métricas e traces de um ambiente distribuído é um desafio que exige ferramentas e estratégias robustas.
  * Cultura Organizacional: A adoção do cloud native exige uma mudança de mentalidade e processos, com equipes autônomas, responsabilidades compartilhadas (DevOps) e uma cultura de experimentação.
  * Gerenciamento de Dados Distribuídos: A consistência de dados em um ambiente de microsserviços pode ser um desafio complexo, exigindo padrões como saga patterns ou eventual consistency.
  * Segurança: A superfície de ataque de uma aplicação distribuída é maior, exigindo atenção extra à segurança em todos os níveis: rede, contêineres, APIs, dados.
  * Custo de Transição: Migrar aplicações monolíticas existentes para uma arquitetura cloud native pode ser um processo demorado e custoso, exigindo reengenharia e investimento em novas habilidades.
- Aplicações totalmente cloud native são ideais para cenários que exigem alta performance, escalabilidade massiva e rápida evolução:
  * Grandes Plataformas de E-commerce: Para lidar com picos de tráfego, personalização de experiências e integração com múltiplos sistemas de pagamento e logística.
  * Serviços de Streaming de Mídia: Para escalar o processamento e a entrega de conteúdo para milhões de usuários simultaneamente.
  * Plataformas de Redes Sociais e Colaboração: Que precisam suportar um grande volume de interações e dados em tempo real.
  * Sistemas de IoT (Internet das Coisas): Para ingerir, processar e analisar grandes volumes de dados de sensores e dispositivos.
  * Aplicações de Inteligência Artificial e Machine Learning: Onde o treinamento e a inferência de modelos podem exigir recursos computacionais massivos e escaláveis.
  * SaaS (Software as a Service): Para oferecer serviços multitenant com alta disponibilidade e escalabilidade para múltiplos clientes.
  * Fintechs: Para processar transações financeiras com segurança, agilidade e em conformidade com regulamentações.
  * Gaming Online: Para fornecer experiências de jogo em tempo real com baixa latência e alta disponibilidade.

### Cenário de demonstração: fluxo de processamento de solicitações de um sistema de aluguel de carros ("RentACar"), utilizando serviços e padrões comuns de arquitetura distribuída e baseada em eventos.
![image](https://github.com/user-attachments/assets/b1e6b5d0-6721-47db-95bd-3c224985535f)
- Aplicações em Cloud Computing (Azure) Elencando os Recursos dessa Arquitetura (terraform/main.tf):
  * HTTP (TrAlego Http) - Recurso Azure: Azure API Management ou Azure Application Gateway.
    * Aplicação: O API Management atua como um front-end unificado para todas as APIs da sua aplicação, permitindo a gestão de versões, segurança (OAuth, JWT), cache, monitoramento e transformação de payloads. O Application Gateway atua como um balanceador de carga de camada 7 e WAF (Web Application Firewall) para proteger as aplicações web de vulnerabilidades comuns.
  * DNS - Recurso Azure: Azure DNS.
    * Aplicação: Fornece um serviço de resolução de nomes altamente disponível e escalável, integrado com outros serviços Azure, garantindo que as solicitações cheguem aos endpoints corretos da sua aplicação.
  * Front RentACar - Recurso Azure: Azure Front Door, Azure Application Gateway ou Azure CDN.
    * Aplicação:
      * Azure Front Door: Ideal para roteamento de tráfego global, aceleração de aplicações web (anycast), balanceamento de carga global, offload SSL e WAF. Essencial para garantir baixa latência e alta disponibilidade para usuários distribuídos geograficamente.
      * Azure Application Gateway: Para balanceamento de carga de aplicações web dentro de uma região, com recursos como roteamento baseado em URL, afinidade de sessão e WAF.
      * Azure CDN: Para armazenar em cache e entregar conteúdo estático (imagens, CSS, JS) de forma rápida e eficiente para usuários em todo o mundo.
  * BFF-RentACar Node - Recurso Azure: Azure Container Apps (com Dapr), Azure App Service ou Azure Functions.
    * Aplicação:
      * Azure Container Apps: Excelente para hospedar microserviços baseados em contêiner, com recursos de escalabilidade automática, revisão de versões e, opcionalmente, integração com Dapr para resiliência (retries, circuit breakers) e descoberta de serviço.
      * Azure App Service: Uma plataforma totalmente gerenciada para hospedar aplicações web, APIs REST e backends móveis. Oferece escalabilidade automática e integração com CI/CD.
      * Azure Functions: Pode ser usado se o BFF tiver uma lógica mais acionada por eventos e sem estado (embora Container Apps seja geralmente mais adequado para BFFs completos).
  * RentProcess (Serviço/Microserviço) - Recurso Azure: Azure Functions (para serverless), Azure Container Apps ou Azure Kubernetes Service (AKS).
    * Aplicação:
      * Azure Functions: Perfeito para a lógica de processamento de aluguel que pode ser executada sob demanda e escalada automaticamente para lidar com picos de tráfego, pagando apenas pelo tempo de execução.
      * Azure Container Apps/AKS: Para o processo de aluguel como um microserviço em contêiner, oferecendo maior controle sobre o ambiente de execução e capacidade de orquestração complexa (AKS).
  * Banco de Dados - Recurso Azure: Azure Database for PostgreSQL/MySQL Flexible Server (relacionais), Azure SQL Database (SQL Server), Azure Cosmos DB (NoSQL).
    * Aplicação:
      * Azure Database for PostgreSQL/MySQL Flexible Server: Bancos de dados relacionais gerenciados com alta disponibilidade, backups automáticos, escalabilidade e segurança.
      * Azure Cosmos DB: Um banco de dados NoSQL distribuído globalmente, multi-modelo, ideal para dados de aluguel com esquemas flexíveis e alta necessidade de throughput e baixa latência. Suporta APIs como SQL, MongoDB, Cassandra, Gremlin e Table.
  * PaymentQueue / NotificationQueue - Recurso Azure: Azure Service Bus Queues.
    * Aplicação: Fornece um serviço de mensagens assíncrono e confiável, garantindo que as operações de pagamento e notificação sejam desacopladas do fluxo principal, melhorando a resiliência e a escalabilidade da aplicação. As mensagens são persistidas até serem processadas com sucesso.
  * PaymentProcess / EmailNotification - Recurso Azure: Azure Functions (para processamento de eventos da fila), Azure Logic Apps (para orquestração de fluxos de trabalho).
    * Aplicação:
      * Azure Functions: Consumirá mensagens da PaymentQueue e NotificationQueue para processar pagamentos e gerar notificações. A escalabilidade serverless é crucial para lidar com volumes variados de transações.
      * Azure Logic Apps: Pode ser usado para orquestrar fluxos de trabalho mais complexos para a notificação por e-mail, integrando-se facilmente com outros serviços Azure e externos (como serviços de e-mail).
  * PaymentsStatus - Recurso Azure: Azure Cosmos DB ou Azure Cache for Redis.
    * Aplicação:
      * Azure Cosmos DB: Para persistir o status dos pagamentos de forma durável e com alta performance, permitindo consultas rápidas.
      * Azure Cache for Redis: Pode ser usado como uma camada de cache para o status de pagamentos, reduzindo a carga sobre o banco de dados principal e fornecendo latência de leitura extremamente baixa.
  * Send Email - Recurso Azure: Azure Communication Services (Email) ou integração via Azure Logic Apps.
    * Aplicação:
      * Azure Communication Services (Email): Um serviço para enviar e-mails transacionais e de marketing de forma programática, com alta confiabilidade e gerenciamento de reputação.
      * Azure Logic Apps: Pode ser configurado para acionar o envio de e-mails via conectores para serviços de e-mail (como o próprio Azure Communication Services, SendGrid, etc.) ou via APIs.


















