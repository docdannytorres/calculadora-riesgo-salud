<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calculadora de Riesgo de Salud</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h1, h2 {
            text-align: center;
        }
        label {
            display: block;
            margin: 10px 0 5px;
            font-weight: bold;
        }
        input, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        button {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        .results {
            margin-top: 20px;
            padding: 15px;
            background-color: #e9ecef;
            border-radius: 5px;
        }
        .intro {
            text-align: center;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Calculadora de Riesgo de Salud</h1>
        <div class="intro">
            <p>Esta es una calculadora hecha por <strong>@docdannytorres</strong>.</p>
        </div>
        <form id="healthForm">
            <h2>Datos Demográficos</h2>
            <label for="age">Edad:</label>
            <input type="number" id="age" name="age" min="0" required>

            <label for="gender">Género:</label>
            <select id="gender" name="gender" required>
                <option value="">Selecciona...</option>
                <option value="male">Masculino</option>
                <option value="female">Femenino</option>
            </select>

            <label for="weight">Peso (kg):</label>
            <input type="number" id="weight" name="weight" min="0" required>

            <label for="height">Altura (cm):</label>
            <input type="number" id="height" name="height" min="0" required>

            <h2>Estilo de Vida</h2>
            <label for="smoking">¿Fumas?</label>
            <select id="smoking" name="smoking" required>
                <option value="">Selecciona...</option>
                <option value="no">No</option>
                <option value="yes">Sí</option>
            </select>

            <label for="physicalActivity">Actividad Física:</label>
            <select id="physicalActivity" name="physicalActivity" required>
                <option value="">Selecciona...</option>
                <option value="sedentary">Sedentario</option>
                <option value="moderate">Moderada</option>
                <option value="active">Activa</option>
            </select>

            <label for="sleep">Horas de Sueño por Noche:</label>
            <input type="number" id="sleep" name="sleep" min="0" required>

            <label for="stress">Nivel de Estrés:</label>
            <select id="stress" name="stress" required>
                <option value="">Selecciona...</option>
                <option value="low">Bajo</option>
                <option value="moderate">Moderado</option>
                <option value="high">Alto</option>
            </select>

            <h2>Datos de Salud</h2>
            <label for="bloodPressure">Presión Arterial (sistólica/diastólica):</label>
            <input type="text" id="bloodPressure" name="bloodPressure" placeholder="Ejemplo: 120/80" required>

            <label for="glucose">Glucosa (mg/dL):</label>
            <input type="number" id="glucose" name="glucose" min="0" required>

            <label for="cholesterol">Colesterol (total, HDL, LDL en mg/dL):</label>
            <input type="text" id="cholesterol" name="cholesterol" placeholder="Ejemplo: 200, 50, 130" required>

            <label for="familyHistory">Historial Familiar de Enfermedades:</label>
            <select id="familyHistory" name="familyHistory" required>
                <option value="">Selecciona...</option>
                <option value="none">Ninguna</option>
                <option value="cardiovascular">Cardiovasculares</option>
                <option value="diabetes">Diabetes</option>
                <option value="both">Ambas</option>
            </select>

            <button type="button" onclick="calculateRisk()">Calcular Riesgo</button>
        </form>

        <div class="results" id="results" style="display: none;">
            <h2>Resultados</h2>
            <p id="riskOutput"></p>
        </div>
    </div>

    <script>
        function calculateRisk() {
            const age = parseInt(document.getElementById('age').value);
            const gender = document.getElementById('gender').value;
            const weight = parseFloat(document.getElementById('weight').value);
            const height = parseFloat(document.getElementById('height').value);
            const smoking = document.getElementById('smoking').value;
            const physicalActivity = document.getElementById('physicalActivity').value;
            const sleep = parseInt(document.getElementById('sleep').value);
            const stress = document.getElementById('stress').value;
            const bloodPressure = document.getElementById('bloodPressure').value;
            const glucose = parseFloat(document.getElementById('glucose').value);
            const cholesterol = document.getElementById('cholesterol').value;
            const familyHistory = document.getElementById('familyHistory').value;

            // Cálculos básicos (esto es un marcador; fórmulas reales deben ser más avanzadas)
            let riskScore = 0;

            // Puntos por edad
            riskScore += age > 50 ? 20 : age > 30 ? 10 : 5;

            // Puntos por fumar
            riskScore += smoking === 'yes' ? 20 : 0;

            // Ajuste por actividad física
            riskScore -= physicalActivity === 'active' ? 10 : physicalActivity === 'moderate' ? 5 : 0;

            // Ajuste por sueño
            riskScore += sleep < 5 || sleep > 8 ? 10 : 0;

            // Ajuste por estrés
            riskScore += stress === 'high' ? 15 : stress === 'moderate' ? 10 : 0;

            // Puntos por historial familiar
            riskScore += familyHistory === 'both' ? 20 : familyHistory !== 'none' ? 10 : 0;

            // Clasificación de riesgo
            const riskLevel = riskScore > 50 ? 'Alto' : riskScore > 30 ? 'Moderado' : 'Bajo';

            // Mostrar resultados
            const resultsDiv = document.getElementById('results');
            const riskOutput = document.getElementById('riskOutput');
            resultsDiv.style.display = 'block';
            riskOutput.textContent = `Tu nivel de riesgo estimado es: ${riskLevel} (Puntaje: ${riskScore})`;
        }
    </script>
</body>
</html>
