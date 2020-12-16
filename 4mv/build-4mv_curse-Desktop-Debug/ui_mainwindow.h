/********************************************************************************
** Form generated from reading UI file 'mainwindow.ui'
**
** Created by: Qt User Interface Compiler version 5.12.8
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_MAINWINDOW_H
#define UI_MAINWINDOW_H

#include <QtCore/QVariant>
#include <QtWidgets/QApplication>
#include <QtWidgets/QCheckBox>
#include <QtWidgets/QColumnView>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QLabel>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QMenuBar>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QStatusBar>
#include <QtWidgets/QTableView>
#include <QtWidgets/QTextEdit>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_MainWindow
{
public:
    QWidget *centralwidget;
    QPushButton *pushButton;
    QColumnView *columnView;
    QCheckBox *checkBox;
    QCheckBox *checkBox_2;
    QCheckBox *checkBox_3;
    QCheckBox *checkBox_4;
    QCheckBox *checkBox_5;
    QCheckBox *checkBox_6;
    QTextEdit *textEdit;
    QPushButton *pushButton_2;
    QPushButton *pushButton_3;
    QPushButton *pushButton_4;
    QPushButton *pushButton_5;
    QTableView *tableView;
    QPushButton *pushButton_6;
    QCheckBox *checkBox_7;
    QCheckBox *checkBox_8;
    QTextEdit *textEdit_2;
    QTextEdit *textEdit_3;
    QLabel *label;
    QLabel *label_2;
    QCheckBox *checkBox_9;
    QMenuBar *menubar;
    QStatusBar *statusbar;

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName(QString::fromUtf8("MainWindow"));
        MainWindow->resize(800, 600);
        MainWindow->setAutoFillBackground(false);
        MainWindow->setAnimated(false);
        MainWindow->setDocumentMode(false);
        centralwidget = new QWidget(MainWindow);
        centralwidget->setObjectName(QString::fromUtf8("centralwidget"));
        pushButton = new QPushButton(centralwidget);
        pushButton->setObjectName(QString::fromUtf8("pushButton"));
        pushButton->setGeometry(QRect(570, 30, 71, 31));
        columnView = new QColumnView(centralwidget);
        columnView->setObjectName(QString::fromUtf8("columnView"));
        columnView->setGeometry(QRect(80, 70, 641, 161));
        columnView->setStyleSheet(QString::fromUtf8("background-color: rgb(114, 159, 207);"));
        checkBox = new QCheckBox(centralwidget);
        checkBox->setObjectName(QString::fromUtf8("checkBox"));
        checkBox->setGeometry(QRect(90, 90, 92, 23));
        checkBox->setChecked(true);
        checkBox->setAutoExclusive(true);
        checkBox->setTristate(false);
        checkBox_2 = new QCheckBox(centralwidget);
        checkBox_2->setObjectName(QString::fromUtf8("checkBox_2"));
        checkBox_2->setGeometry(QRect(300, 90, 92, 23));
        checkBox_2->setAutoExclusive(true);
        checkBox_3 = new QCheckBox(centralwidget);
        checkBox_3->setObjectName(QString::fromUtf8("checkBox_3"));
        checkBox_3->setGeometry(QRect(510, 90, 141, 23));
        checkBox_3->setAutoExclusive(true);
        checkBox_4 = new QCheckBox(centralwidget);
        checkBox_4->setObjectName(QString::fromUtf8("checkBox_4"));
        checkBox_4->setGeometry(QRect(90, 120, 151, 23));
        checkBox_4->setAutoExclusive(true);
        checkBox_5 = new QCheckBox(centralwidget);
        checkBox_5->setObjectName(QString::fromUtf8("checkBox_5"));
        checkBox_5->setGeometry(QRect(300, 120, 121, 23));
        checkBox_5->setAutoExclusive(true);
        checkBox_6 = new QCheckBox(centralwidget);
        checkBox_6->setObjectName(QString::fromUtf8("checkBox_6"));
        checkBox_6->setGeometry(QRect(510, 120, 211, 23));
        checkBox_6->setAutoExclusive(true);
        textEdit = new QTextEdit(centralwidget);
        textEdit->setObjectName(QString::fromUtf8("textEdit"));
        textEdit->setGeometry(QRect(80, 30, 481, 31));
        pushButton_2 = new QPushButton(centralwidget);
        pushButton_2->setObjectName(QString::fromUtf8("pushButton_2"));
        pushButton_2->setGeometry(QRect(120, 520, 111, 25));
        pushButton_3 = new QPushButton(centralwidget);
        pushButton_3->setObjectName(QString::fromUtf8("pushButton_3"));
        pushButton_3->setGeometry(QRect(280, 520, 111, 25));
        pushButton_4 = new QPushButton(centralwidget);
        pushButton_4->setObjectName(QString::fromUtf8("pushButton_4"));
        pushButton_4->setGeometry(QRect(430, 520, 101, 25));
        pushButton_5 = new QPushButton(centralwidget);
        pushButton_5->setObjectName(QString::fromUtf8("pushButton_5"));
        pushButton_5->setGeometry(QRect(570, 520, 111, 25));
        tableView = new QTableView(centralwidget);
        tableView->setObjectName(QString::fromUtf8("tableView"));
        tableView->setGeometry(QRect(80, 70, 641, 421));
        tableView->setStyleSheet(QString::fromUtf8("gridline-color: rgb(78, 154, 6);\n"
"background-color: rgb(90, 138, 244);"));
        tableView->setSizeAdjustPolicy(QAbstractScrollArea::AdjustToContents);
        tableView->setEditTriggers(QAbstractItemView::NoEditTriggers);
        tableView->setDragDropOverwriteMode(false);
        tableView->setAlternatingRowColors(false);
        tableView->setSortingEnabled(true);
        tableView->setCornerButtonEnabled(false);
        tableView->horizontalHeader()->setCascadingSectionResizes(false);
        tableView->horizontalHeader()->setMinimumSectionSize(5);
        tableView->horizontalHeader()->setDefaultSectionSize(50);
        tableView->verticalHeader()->setVisible(false);
        tableView->verticalHeader()->setHighlightSections(false);
        pushButton_6 = new QPushButton(centralwidget);
        pushButton_6->setObjectName(QString::fromUtf8("pushButton_6"));
        pushButton_6->setGeometry(QRect(650, 30, 71, 31));
        checkBox_7 = new QCheckBox(centralwidget);
        checkBox_7->setObjectName(QString::fromUtf8("checkBox_7"));
        checkBox_7->setGeometry(QRect(90, 150, 131, 23));
        checkBox_8 = new QCheckBox(centralwidget);
        checkBox_8->setObjectName(QString::fromUtf8("checkBox_8"));
        checkBox_8->setGeometry(QRect(300, 150, 171, 23));
        textEdit_2 = new QTextEdit(centralwidget);
        textEdit_2->setObjectName(QString::fromUtf8("textEdit_2"));
        textEdit_2->setGeometry(QRect(170, 180, 171, 31));
        textEdit_3 = new QTextEdit(centralwidget);
        textEdit_3->setObjectName(QString::fromUtf8("textEdit_3"));
        textEdit_3->setGeometry(QRect(390, 180, 171, 31));
        label = new QLabel(centralwidget);
        label->setObjectName(QString::fromUtf8("label"));
        label->setGeometry(QRect(130, 180, 41, 31));
        label_2 = new QLabel(centralwidget);
        label_2->setObjectName(QString::fromUtf8("label_2"));
        label_2->setGeometry(QRect(360, 180, 31, 31));
        checkBox_9 = new QCheckBox(centralwidget);
        checkBox_9->setObjectName(QString::fromUtf8("checkBox_9"));
        checkBox_9->setGeometry(QRect(510, 150, 92, 23));
        MainWindow->setCentralWidget(centralwidget);
        pushButton->raise();
        columnView->raise();
        checkBox->raise();
        checkBox_2->raise();
        checkBox_3->raise();
        checkBox_4->raise();
        checkBox_5->raise();
        checkBox_6->raise();
        textEdit->raise();
        pushButton_2->raise();
        pushButton_3->raise();
        pushButton_4->raise();
        pushButton_5->raise();
        pushButton_6->raise();
        checkBox_7->raise();
        checkBox_8->raise();
        textEdit_2->raise();
        textEdit_3->raise();
        label->raise();
        label_2->raise();
        checkBox_9->raise();
        tableView->raise();
        menubar = new QMenuBar(MainWindow);
        menubar->setObjectName(QString::fromUtf8("menubar"));
        menubar->setGeometry(QRect(0, 0, 800, 22));
        MainWindow->setMenuBar(menubar);
        statusbar = new QStatusBar(MainWindow);
        statusbar->setObjectName(QString::fromUtf8("statusbar"));
        MainWindow->setStatusBar(statusbar);

        retranslateUi(MainWindow);

        QMetaObject::connectSlotsByName(MainWindow);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindow)
    {
        MainWindow->setWindowTitle(QApplication::translate("MainWindow", "Pool", nullptr));
        pushButton->setText(QApplication::translate("MainWindow", "\320\237\320\276\320\270\321\201\320\272", nullptr));
        checkBox->setText(QApplication::translate("MainWindow", "\320\244\320\230\320\236", nullptr));
        checkBox_2->setText(QApplication::translate("MainWindow", "\320\237\320\276\320\273", nullptr));
        checkBox_3->setText(QApplication::translate("MainWindow", "\320\235\320\276\320\274\320\265\321\200 \321\202\320\265\320\273\320\265\321\204\320\276\320\275\320\260", nullptr));
        checkBox_4->setText(QApplication::translate("MainWindow", "\320\224\320\260\321\202\320\260 \321\200\320\265\320\263\320\270\321\201\321\202\321\200\320\260\321\206\320\270\320\270", nullptr));
        checkBox_5->setText(QApplication::translate("MainWindow", "\320\224\320\260\321\202\320\260 \320\276\320\277\320\273\320\260\321\202\321\213", nullptr));
        checkBox_6->setText(QApplication::translate("MainWindow", "\320\264\320\273\320\270\321\202\320\265\320\273\321\214\320\275\320\276\321\201\321\202\321\214 \320\260\320\261\320\276\320\275\320\270\320\274\320\265\320\275\321\202\320\260", nullptr));
        pushButton_2->setText(QApplication::translate("MainWindow", "\320\224\320\276\320\261\320\260\320\262\320\270\321\202\321\214", nullptr));
        pushButton_3->setText(QApplication::translate("MainWindow", "\320\240\320\265\320\264\320\260\320\272\321\202\320\270\321\200\320\276\320\262\320\260\321\202\321\214", nullptr));
        pushButton_4->setText(QApplication::translate("MainWindow", "\320\243\320\264\320\260\320\273\320\270\321\202\321\214", nullptr));
        pushButton_5->setText(QApplication::translate("MainWindow", "\320\236\320\277\320\273\320\260\321\202\320\260", nullptr));
        pushButton_6->setText(QApplication::translate("MainWindow", ">>", nullptr));
        checkBox_7->setText(QApplication::translate("MainWindow", "\320\277\320\265\321\200\320\270\320\276\320\264 \320\276\320\277\320\273\320\260\321\202\321\213", nullptr));
        checkBox_8->setText(QApplication::translate("MainWindow", "\320\277\320\265\321\200\320\270\320\276\320\264 \321\200\320\265\320\263\320\270\321\201\321\202\321\200\320\260\321\206\320\270\320\270", nullptr));
        label->setText(QApplication::translate("MainWindow", "\320\276\321\202", nullptr));
        label_2->setText(QApplication::translate("MainWindow", "\320\264\320\276", nullptr));
        checkBox_9->setText(QApplication::translate("MainWindow", "\321\201\320\261\321\200\320\276\321\201", nullptr));
    } // retranslateUi

};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAINWINDOW_H
