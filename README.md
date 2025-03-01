# NiFi-Postgres Demo

This project demonstrates how to use Apache NiFi to synchronize data between two PostgreSQL databases using Docker. The demo includes:

- A custom NiFi Docker container (extended from the official image) with the PostgreSQL JDBC driver pre-installed.
- A "remote" PostgreSQL database (simulated via Docker) containing a sample table.
- A "local" PostgreSQL database that receives data from NiFi.
- An Apache NiFi template (`SimplePostgre.xml`) to easily set up the data flow.

## Prerequisites

- Docker and Docker Compose installed on your machine.
- (Optional) Git to clone the repository.

## How to Run

1. **Clone the repository:**

   ```bash
   git clone https://github.com/batugane/nifi-postgres-demo.git
   cd nifi-postgres-demo
   ```

2. **Build and run the containers:**

   ```bash
   docker-compose up --build
   ```

3. **Access Apache NiFi:**

   Open your browser and go to [http://localhost:8080/nifi](http://localhost:8080/nifi).

## Importing the NiFi Template

1. **Upload the Template:**

   - In the NiFi UI, click on the **"Templates"** icon in the toolbar.
   - Click the **"Upload Template"** button and select the `SimplePostgre.xml` file from the repository.

2. **Instantiate the Template:**

   - Drag the template from the **"Templates"** panel onto the NiFi canvas to instantiate it.

## Configuring NiFi

Once the template is instantiated, perform the following in the NiFi UI:

### A. Set Up Controller Services

1. Click on the gear icon (Controller Settings) in the upper-right corner.
2. Go to the **Controller Services** tab.
3. **Enable the DBCPConnectionPool Controller Services** for both the remote and local databases:
   - **RemoteDBPool**: Ensure the connection details match your setup.
   - **LocalDBPool**: Ensure the connection details match your setup.

### B. Create Your Data Flow

1. **Add a Processor:** `QueryDatabaseTable`
   - Configure it to use the **RemoteDBPool**.
   - Set the SQL query, for example:  
     `SELECT * FROM sample_data WHERE`
   - Adjust the scheduling interval (e.g., every 30 seconds).

2. **(Optional) Add a Transformation Processor:**  
   If needed, use processors such as `ConvertRecord` to adjust data formats.

3. **Add a Processor:** `PutDatabaseRecord`
   - Configure it to use the **LocalDBPool**.
   - Set the target table name (e.g., `sample_data`).
   - Map the record fields accordingly.

4. **Connect the Processors:**  
   Link the flow so that the output of `QueryDatabaseTable` is routed (and optionally transformed) before being sent to `PutDatabaseRecord`.

### C. Test and Monitor

- Insert additional rows into the remote database (using a SQL client or psql) and verify that they appear in the local database.
- Use the NiFi Data Provenance feature to trace the flow of data through your processors.

## Final Notes

This demo is a minimal setup intended to showcase Apache NiFi's capabilities in synchronizing data between PostgreSQL databases. Feel free to extend or modify the flow for more advanced use cases.

Enjoy!

---

### Running the Project

1. **Clone and Navigate:**

   ```bash
   git clone https://github.com/yourusername/nifi-postgres-demo.git
   cd nifi-postgres-demo
   ```

2. **Build and Start:**

   ```bash
   docker-compose up --build
   ```

3. **Open NiFi UI:**  
   Visit [http://localhost:8080/nifi](http://localhost:8080/nifi) and configure your flow as documented in the README.

With this setup, your colleagues can simply clone the repository and run `docker-compose up --build` to get a working demo of Apache NiFi synchronizing data between two PostgreSQL instances with minimal manual intervention.