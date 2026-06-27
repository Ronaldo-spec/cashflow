# Cashflow

A Flutter mobile application project for local transaction tracking and simple summary reporting.

This repository is documented as a portfolio project to show mobile application development, local database usage, CRUD workflow design, and simple reporting-oriented thinking.

---

## Business Problem

Personal or small-scale transaction tracking can become difficult when records are scattered across notes, chats, or manual spreadsheets. A simple mobile application can help users record transactions locally, organize them by category, and review basic financial summaries.

This project demonstrates how a transaction recording workflow can be translated into a mobile application using Flutter and local storage.

---

## Project Context

Cashflow is a mobile app built with Flutter and Dart. It focuses on local record management, category-based organization, and simple summary views.

The app uses SQLite support through `sqflite`, with helper packages for formatting and local storage path handling.

---

## Assumptions

1. The app is designed for local transaction recording.
2. Transaction data can be stored locally on the device.
3. Users need basic category and date-based organization.
4. Summary views are used to support quick review, not full accounting analysis.
5. The repository is positioned as a mobile application portfolio project, not a production finance product.

---

## Methodology

The project was developed using a mobile CRUD workflow approach:

1. Define the transaction recording problem.
2. Design local data storage using SQLite.
3. Build the mobile application structure using Flutter.
4. Implement record creation, reading, updating, and deletion flow.
5. Organize records by category and date.
6. Prepare simple summary views.
7. Document the project for portfolio review.

---

## Main Objectives

- Store records locally.
- Organize records by category and date.
- Support basic summary views.
- Demonstrate mobile CRUD-oriented application logic.
- Translate a simple record process into a mobile workflow.

---

## Tech Stack

| Area | Technology |
|---|---|
| Mobile Framework | Flutter |
| Language | Dart |
| Local Database | sqflite |
| Formatting | intl |
| Local Path Handling | path_provider, path |

---

## Implementation Notes

This project demonstrates:

- Flutter mobile application structure
- Local database usage with `sqflite`
- Transaction data modeling
- CRUD workflow design
- Category-based record organization
- Simple reporting-oriented application logic

---

## Installation

Clone the repository:

```bash
git clone https://github.com/Ronaldo-spec/cashflow.git
cd cashflow
```

Install dependencies:

```bash
flutter pub get
```

Run the app:

```bash
flutter run
```

---

## Recommendation

For portfolio presentation, this repository should be positioned as a mobile CRUD and local database project. The strongest value is not only the Flutter UI, but also the ability to model a simple real-world record process into a working mobile workflow.

Recommended improvements:

1. Add screenshots or demo output.
2. Add sample data.
3. Add dashboard preview.
4. Add export feature.
5. Add clearer architecture documentation.

---

## Future Improvement

- Add income and expense summary dashboard.
- Add monthly filtering.
- Add export to CSV or Excel.
- Add charts for spending categories.
- Add backup and restore feature.
- Add authentication if multi-user usage is needed.
- Add architecture diagram.

---

## Portfolio Value

This project is useful to demonstrate Flutter mobile application development, local database usage, record data modeling, CRUD workflow design, and simple reporting-oriented thinking.

---

## Author

**Ronaldo Firmansyah**  
Programmer | Business Analyst | ERP/Application Support | SQL Reporting | Data Analyst

LinkedIn: [linkedin.com/in/ronaldofirmansyah](https://linkedin.com/in/ronaldofirmansyah)  
GitHub: [github.com/Ronaldo-spec](https://github.com/Ronaldo-spec)
