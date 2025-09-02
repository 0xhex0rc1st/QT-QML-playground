#include <QApplication>
#include <QGroupBox>
#include <QPushButton>
#include <QRadioButton>
#include <QVBoxLayout>
#include <QHBoxLayout>
#include <QListView>
#include <QLineEdit>
#include <QString>
#include <QRegularExpression>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);

    QWidget wgt;
    wgt.setWindowTitle("Calculator");

    auto button1 = new QPushButton("1");
    auto button2 = new QPushButton("2");
    auto button3 = new QPushButton("3");
    auto button4 = new QPushButton("4");
    auto button5 = new QPushButton("5");
    auto button6 = new QPushButton("6");
    auto button7 = new QPushButton("7");
    auto button8 = new QPushButton("8");
    auto button9 = new QPushButton("9");
    auto button0 = new QPushButton("0");
    auto buttonp = new QPushButton("+");
    auto buttond = new QPushButton("-");
    auto buttone = new QPushButton("=");
    auto buttonc = new QPushButton("C");
    auto lineedit = new QLineEdit;
    lineedit->setDisabled(true);
    lineedit->setFixedHeight(45);

    buttone->setFixedWidth(45);
    buttone->setFixedHeight(60);

    buttonc->setFixedHeight(60);
    buttonc->setFixedWidth(45);

    auto display = [lineedit](const QString &text) {
        lineedit->setText(lineedit->text() + text);
    };

    QObject::connect(button1, &QPushButton::clicked, [display]() { display("1"); });
    QObject::connect(button2, &QPushButton::clicked, [display]() { display("2"); });
    QObject::connect(button3, &QPushButton::clicked, [display]() { display("3"); });
    QObject::connect(button4, &QPushButton::clicked, [display]() { display("4"); });
    QObject::connect(button5, &QPushButton::clicked, [display]() { display("5"); });
    QObject::connect(button6, &QPushButton::clicked, [display]() { display("6"); });
    QObject::connect(button7, &QPushButton::clicked, [display]() { display("7"); });
    QObject::connect(button8, &QPushButton::clicked, [display]() { display("8"); });
    QObject::connect(button9, &QPushButton::clicked, [display]() { display("9"); });
    QObject::connect(button0, &QPushButton::clicked, [display]() { display("0"); });
    QObject::connect(buttonp, &QPushButton::clicked, [display]() { display("+"); });
    QObject::connect(buttond, &QPushButton::clicked, [display]() { display("-"); });
    QObject::connect(buttone, &QPushButton::clicked, [lineedit]() {
        QString expr = lineedit->text();
        int result = 0;
        QRegularExpression re("([+-]?\\d+)");
        QRegularExpressionMatchIterator i = re.globalMatch(expr);

        while (i.hasNext()) {
            QRegularExpressionMatch match = i.next();
            result += match.captured(0).toInt();
        }
        lineedit->setText(QString::number(result));
    });
    QObject::connect(buttonc, &QPushButton::clicked, [lineedit]() {
        lineedit->setText("");
    });

    auto layout_row1 = new QHBoxLayout;
    layout_row1->addWidget(button1);
    layout_row1->addWidget(button2);
    layout_row1->addWidget(button3);

    auto layout_row2 = new QHBoxLayout;
    layout_row2->addWidget(button4);
    layout_row2->addWidget(button5);
    layout_row2->addWidget(button6);

    auto layout_row3 = new QHBoxLayout;
    layout_row3->addWidget(button7);
    layout_row3->addWidget(button8);
    layout_row3->addWidget(button9);

    auto layout_row4 = new QHBoxLayout;
    layout_row4->addWidget(buttond);
    layout_row4->addWidget(button0);
    layout_row4->addWidget(buttonp);

    auto num_layout = new QVBoxLayout;
    num_layout->addLayout(layout_row1);
    num_layout->addLayout(layout_row2);
    num_layout->addLayout(layout_row3);
    num_layout->addLayout(layout_row4);

    auto side_layout = new QVBoxLayout;
    side_layout->addWidget(buttonc);
    side_layout->addWidget(buttone);

    auto down_layout = new QHBoxLayout;
    down_layout->addLayout(num_layout);
    down_layout->addLayout(side_layout);

    auto layout_main = new QVBoxLayout(&wgt);
    layout_main->addSpacing(50);
    layout_main->addWidget(lineedit);
    layout_main->addStretch();
    layout_main->addLayout(down_layout);
    layout_main->addSpacing(20);

    wgt.show();

    return a.exec();
}
