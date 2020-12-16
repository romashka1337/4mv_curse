#ifndef STDAFX_H
#define STDAFX_H

#include <bits/stdc++.h>
#include <QMainWindow>
#include <QtSql>
#include <QSqlDriver>
#include <QSqlQuery>
#include <QTextEdit>
#include <QString>
#include <QButtonGroup>
#include <QTimer>
#include <QMessageBox>
#include <QDialog>
#include <QMenu>
#include <QTextBrowser>

static QSqlDatabase db;
static QButtonGroup bg;
static QSqlTableModel *model;
static bool hidden = true;

#endif // STDAFX_H
