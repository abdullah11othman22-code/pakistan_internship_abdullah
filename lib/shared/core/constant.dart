import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/models/task.dart';
import 'package:project1/models/test.dart';
import 'package:project1/models/week.dart';
import 'package:project1/screens/week1/week_1_tasks/task1/counter_screen.dart';
import 'package:project1/screens/week2/week_2_task_1/task1.dart';
import 'package:project1/shared/widgets/tasks_screen.dart';
import '../../models/to_do_model_draft.dart';
import '../../screens/week1/week_1_tasks/task2/basic_contact_form.dart';
import '../../screens/week3/week3_task1/week3_task1.dart';
import '../../screens/week4/week4_task1.dart';
import '../../screens/week5/task_1/recipe_app.dart';

List<Week> weeks = [
  Week(
    title: "Week-1-",
    screen: TasksScreen(numberWeek: 1,),
    tasks: [
      Task(
        taskId: "Task-1-",
        title: "Simble Counter App",
        state: "done",
        screen: CounterPage(),
      ),
      Task(
        taskId: "Task-2-",
        title: "Basic Contact Form ",
        state: "done",
        screen: BasicContactForm(),
      ),
    ],
  ),
  Week(
    title: "Week -2-",
    screen: TasksScreen(numberWeek: 2,),
    tasks: [
      Task(
        taskId: "Task-1-",
        state: "done",
        screen: SimpleShoppingListScreen(),
        title: "Simble Shopping List App",
      ),
    ],
  ),
  Week(
    title: "Week -3-",
    screen: TasksScreen(numberWeek: 3),
    tasks: [
      Task(
        taskId: "Task-1-",
        state: "done",
        title: "Quiz App",
        screen: Week3Task1(
          tests: [
            TestModel(
              questions: [
                QuestionModel(
                  answers: [
                    AnswerModel(answer: '5'),
                    AnswerModel(answer: '6'),
                    AnswerModel(answer: '7', isTrue: true),
                    AnswerModel(answer: '8'),
                  ],
                  question: 'what is new number ?',
                  mark: 2,
                ),
                QuestionModel(
                  answers: [
                    AnswerModel(answer: '5'),
                    AnswerModel(answer: '6'),
                    AnswerModel(answer: '7', isTrue: true),
                    AnswerModel(answer: '8'),
                  ],
                  question: 'what is new number ?',
                  mark: 2,
                ),
                QuestionModel(
                  answers: [
                    AnswerModel(answer: '5'),
                    AnswerModel(answer: '6'),
                    AnswerModel(answer: '7', isTrue: true),
                    AnswerModel(answer: '8'),
                  ],
                  question: 'what is new number ?',
                  mark: 2,
                ),
                QuestionModel(
                  answers: [
                    AnswerModel(answer: '5'),
                    AnswerModel(answer: '6'),
                    AnswerModel(answer: '7', isTrue: true),
                    AnswerModel(answer: '8'),
                  ],
                  question: 'what is new number ?',
                  mark: 2,
                ),
                QuestionModel(
                  answers: [
                    AnswerModel(answer: '5'),
                    AnswerModel(answer: '6'),
                    AnswerModel(answer: '7', isTrue: true),
                    AnswerModel(answer: '8'),
                  ],
                  question: 'what is new number ?',
                  mark: 2,
                ),
              ],
              nameTest: "Number Test",
            ),
            TestModel(
              questions: [
                QuestionModel(
                  answers: [
                    AnswerModel(answer: '1'),
                    AnswerModel(answer: '2'),
                    AnswerModel(answer: '3'),
                    AnswerModel(answer: '4', isTrue: true),
                  ],
                  question: 'what is number?',
                  mark: 2,
                ),
                QuestionModel(
                  answers: [
                    AnswerModel(answer: '1'),
                    AnswerModel(answer: '2'),
                    AnswerModel(answer: '3'),
                    AnswerModel(answer: '4', isTrue: true),
                  ],
                  question: 'what is number?',
                  mark: 2,
                ),
                QuestionModel(
                  answers: [
                    AnswerModel(answer: '1'),
                    AnswerModel(answer: '2'),
                    AnswerModel(answer: '3'),
                    AnswerModel(answer: '4', isTrue: true),
                  ],
                  question: 'what is number?',
                  mark: 2,
                ),
                QuestionModel(
                  answers: [
                    AnswerModel(answer: '1'),
                    AnswerModel(answer: '2'),
                    AnswerModel(answer: '3'),
                    AnswerModel(answer: '4', isTrue: true),
                  ],
                  question: 'what is number?',
                  mark: 2,
                ),

                QuestionModel(
                  answers: [
                    AnswerModel(answer: '5'),
                    AnswerModel(answer: '6'),
                    AnswerModel(answer: '7', isTrue: true),
                    AnswerModel(answer: '8'),
                  ],
                  question: 'what is new number ?',
                  mark: 2,
                ),
              ],
              nameTest: "Number Test",
            ),
            TestModel(
              questions: [
                QuestionModel(
                  answers: [
                    AnswerModel(answer: 'الاصنام'),
                    AnswerModel(answer: 'الشيطان', isTrue: true),
                    AnswerModel(answer: 'الشمس', ),
                    AnswerModel(answer: 'الجن الصالح'),
                  ],
                  question: 'ماذا تعبد طائفة اليزيدية؟',
                  mark: 2,
                ),
                QuestionModel(
                  answers: [
                    AnswerModel(answer: 'الجزائر'),
                    AnswerModel(answer: 'الهند'),
                    AnswerModel(answer: 'ايطاليا', isTrue: true),
                    AnswerModel(answer: 'المانيا'),
                  ],
                  question: 'اين تقع بحيرة كومو؟',
                  mark: 3,
                ),
                QuestionModel(
                  answers: [
                    AnswerModel(answer: 'ايسلندا', isTrue: true),
                    AnswerModel(answer: 'فنلند'),
                    AnswerModel(answer: 'النرويج', ),
                    AnswerModel(answer: 'سويسرا'),
                  ],
                  question: 'ما الدولة الوحيدةالتي لا تمتلك جيشا نظاميا؟',
                  mark: 3,
                ),
                QuestionModel(
                  answers: [
                    AnswerModel(answer: 'الكاليسيوم'),
                    AnswerModel(answer: 'البوتاسيوم', isTrue: true),
                    AnswerModel(answer: 'الكوبالت' ),
                    AnswerModel(answer: 'الكريبتون'),
                  ],
                  question: 'اي عنصر كيميائي يرمز له بالرمز "k"؟',
                  mark: 2,
                ),
                QuestionModel(
                  answers: [
                    AnswerModel(answer: '450عضلة تقريبا'),
                    AnswerModel(answer: '600عضلة تقريبا', isTrue: true),
                    AnswerModel(answer: '1000عضلة تقريبا'),
                    AnswerModel(answer: '1260عضلة تقريبا'),
                  ],
                  question: 'كم يبلغ عدد عضلات جسم الانسان تقريبا؟',
                  mark: 3,
                ),
              ],
              nameTest: "لو جدع ادخل",
            ),

              TestModel(
              questions: [
              QuestionModel(
              answers: [
              AnswerModel(answer: 'دمشق'),
              AnswerModel(answer: 'حلب'),
              AnswerModel(answer: 'اللاذقية', isTrue: true),
              AnswerModel(answer: 'حمص'),
              ],
              question: 'ما المحافظة السورية التي تطل مباشرة على البحر المتوسط؟',
              mark: 2,
              ),
              QuestionModel(
answers: [
AnswerModel(answer: 'الفرات', isTrue: true),
AnswerModel(answer: 'النيل'),
AnswerModel(answer: 'دجلة'),
AnswerModel(answer: 'العاصي'),
],
question: 'ما أطول نهر يمر داخل الأراضي السورية؟',
mark: 3,
),
QuestionModel(
answers: [
AnswerModel(answer: 'كندا'),
AnswerModel(answer: 'روسيا', isTrue: true),
AnswerModel(answer: 'الصين'),
AnswerModel(answer: 'البرازيل'),
],
question: 'ما أكبر دولة في العالم من حيث المساحة؟',
mark: 2,
),
QuestionModel(
answers: [
AnswerModel(answer: 'الأطلس'),
AnswerModel(answer: 'الهيمالايا', isTrue: true),
AnswerModel(answer: 'الألب'),
AnswerModel(answer: 'الأنديز'),
],
question: 'أين يقع جبل إيفرست؟',
mark: 3,
),
QuestionModel(
answers: [
AnswerModel(answer: 'بحر قزوين', isTrue: true),
AnswerModel(answer: 'البحر الأسود'),
AnswerModel(answer: 'البحر الأحمر'),
AnswerModel(answer: 'بحر العرب'),
],
question: 'ما أكبر بحر مغلق في العالم؟',
mark: 3,
),
],
nameTest: 'جغرافيا صعبة',
),

TestModel(
questions: [
QuestionModel(
answers: [
AnswerModel(answer: 'صلاح الدين الأيوبي', isTrue: true),
AnswerModel(answer: 'طارق بن زياد'),
AnswerModel(answer: 'سعد بن أبي وقاص'),
AnswerModel(answer: 'هارون الرشيد'),
],
question: 'من القائد الذي حرر القدس في معركة حطين؟',
mark: 2,
),
QuestionModel(
answers: [
AnswerModel(answer: '1914'),
AnswerModel(answer: '1939', isTrue: true),
AnswerModel(answer: '1945'),
AnswerModel(answer: '1920'),
],
question: 'في أي عام بدأت الحرب العالمية الثانية؟',
mark: 2,
),
QuestionModel(
answers: [
AnswerModel(answer: 'الأمويون'),
AnswerModel(answer: 'العباسيون', isTrue: true),
AnswerModel(answer: 'العثمانيون'),
AnswerModel(answer: 'الفاطميون'),
],
question: 'أي دولة اتخذت بغداد عاصمة لها؟',
mark: 3,
),
QuestionModel(
answers: [
AnswerModel(answer: 'حمورابي', isTrue: true),
AnswerModel(answer: 'نبوخذ نصر'),
AnswerModel(answer: 'الإسكندر الأكبر'),
AnswerModel(answer: 'قورش'),
],
question: 'من صاحب أقدم شريعة مكتوبة معروفة؟',
mark: 3,
),
QuestionModel(
answers: [
AnswerModel(answer: 'معركة بدر'),
AnswerModel(answer: 'معركة اليرموك', isTrue: true),
AnswerModel(answer: 'معركة القادسية'),
AnswerModel(answer: 'معركة عين جالوت'),
],
question: 'أي معركة فتحت بلاد الشام للمسلمين؟',
mark: 4,
),
],
nameTest: 'تاريخ ثقيل',
),

TestModel(
questions: [
QuestionModel(
answers: [
AnswerModel(answer: 'أفلاطون'),
AnswerModel(answer: 'سقراط', isTrue: true),
AnswerModel(answer: 'أرسطو'),
AnswerModel(answer: 'ديكارت'),
],
question: 'من الفيلسوف الذي قال: اعرف نفسك؟',
mark: 2,
),
QuestionModel(
answers: [
AnswerModel(answer: 'أنا أفكر إذن أنا موجود', isTrue: true),
AnswerModel(answer: 'الغاية تبرر الوسيلة'),
AnswerModel(answer: 'الإنسان حيوان سياسي'),
AnswerModel(answer: 'العقل السليم في الجسم السليم'),
],
question: 'أي عبارة اشتهر بها ديكارت؟',
mark: 3,
),
QuestionModel(
answers: [
AnswerModel(answer: 'نيتشه'),
AnswerModel(answer: 'أرسطو', isTrue: true),
AnswerModel(answer: 'ماركس'),
AnswerModel(answer: 'فرويد'),
],
question: 'من صاحب كتاب الأخلاق النيقوماخية؟',
mark: 4,
),
QuestionModel(
answers: [
AnswerModel(answer: 'الوجودية', isTrue: true),
AnswerModel(answer: 'البراغماتية'),
AnswerModel(answer: 'المثالية'),
AnswerModel(answer: 'الواقعية'),
],
question: 'أي مدرسة فلسفية ارتبطت بسارتر؟',
mark: 3,
),
QuestionModel(
answers: [
AnswerModel(answer: 'الشك المنهجي', isTrue: true),
AnswerModel(answer: 'الحتمية'),
AnswerModel(answer: 'التجريبية'),
AnswerModel(answer: 'العدمية'),
],
question: 'ما المنهج الذي اعتمده ديكارت للوصول إلى اليقين؟',
mark: 4,
),
],
nameTest: 'فلسفة للمخضرمين',
),

TestModel(
questions: [
QuestionModel(question: 'ما الكوكب الأحمر؟', mark: 2, answers: [AnswerModel(answer: 'المريخ', isTrue: true), AnswerModel(answer: 'زحل'), AnswerModel(answer: 'الأرض'), AnswerModel(answer: 'عطارد')]),
QuestionModel(question: 'من مكتشف الجاذبية؟', mark: 3, answers: [AnswerModel(answer: 'نيوتن', isTrue: true), AnswerModel(answer: 'أينشتاين'), AnswerModel(answer: 'غاليلو'), AnswerModel(answer: 'كوبرنيكوس')]),
QuestionModel(question: 'ما أسرع حيوان بري؟', mark: 2, answers: [AnswerModel(answer: 'الفهد', isTrue: true), AnswerModel(answer: 'الأسد'), AnswerModel(answer: 'الغزال'), AnswerModel(answer: 'النمر')]),
QuestionModel(question: 'كم عدد قارات العالم؟', mark: 2, answers: [AnswerModel(answer: '7', isTrue: true), AnswerModel(answer: '5'), AnswerModel(answer: '6'), AnswerModel(answer: '8')]),
QuestionModel(question: 'من اخترع الهاتف؟', mark: 3, answers: [AnswerModel(answer: 'غراهام بيل', isTrue: true), AnswerModel(answer: 'إديسون'), AnswerModel(answer: 'ماركوني'), AnswerModel(answer: 'تسلا')]),
],
nameTest: 'علوم عامة',
),

TestModel(
questions: [
QuestionModel(question: 'ما عاصمة أستراليا؟', mark: 3, answers: [AnswerModel(answer: 'كانبيرا', isTrue: true), AnswerModel(answer: 'سيدني'), AnswerModel(answer: 'ملبورن'), AnswerModel(answer: 'بيرث')]),
QuestionModel(question: 'أين يقع برج بيزا المائل؟', mark: 2, answers: [AnswerModel(answer: 'إيطاليا', isTrue: true), AnswerModel(answer: 'إسبانيا'), AnswerModel(answer: 'فرنسا'), AnswerModel(answer: 'البرتغال')]),
QuestionModel(question: 'أكبر محيط بالعالم؟', mark: 2, answers: [AnswerModel(answer: 'الهادئ', isTrue: true), AnswerModel(answer: 'الأطلسي'), AnswerModel(answer: 'الهندي'), AnswerModel(answer: 'المتجمد')]),
QuestionModel(question: 'أي دولة تملك أكبر عدد سكان؟', mark: 3, answers: [AnswerModel(answer: 'الهند', isTrue: true), AnswerModel(answer: 'الصين'), AnswerModel(answer: 'أمريكا'), AnswerModel(answer: 'روسيا')]),
QuestionModel(question: 'ما الدولة التي يمر بها نهر الأمازون؟', mark: 4, answers: [AnswerModel(answer: 'البرازيل', isTrue: true), AnswerModel(answer: 'الأرجنتين'), AnswerModel(answer: 'بيرو'), AnswerModel(answer: 'تشيلي')]),
],
nameTest: 'جغرافيا عالمية',
),

TestModel(
questions: [
QuestionModel(question: 'من بنى الأهرامات؟', mark: 2, answers: [AnswerModel(answer: 'الفراعنة', isTrue: true), AnswerModel(answer: 'الرومان'), AnswerModel(answer: 'الفرس'), AnswerModel(answer: 'الإغريق')]),
QuestionModel(question: 'من آخر خلفاء الدولة الأموية؟', mark: 4, answers: [AnswerModel(answer: 'مروان بن محمد', isTrue: true), AnswerModel(answer: 'عبد الملك'), AnswerModel(answer: 'الوليد'), AnswerModel(answer: 'هشام')]),
QuestionModel(question: 'في أي دولة حدثت الثورة الفرنسية؟', mark: 2, answers: [AnswerModel(answer: 'فرنسا', isTrue: true), AnswerModel(answer: 'ألمانيا'), AnswerModel(answer: 'روسيا'), AnswerModel(answer: 'إيطاليا')]),
QuestionModel(question: 'من القائد المغولي الشهير؟', mark: 3, answers: [AnswerModel(answer: 'جنكيز خان', isTrue: true), AnswerModel(answer: 'هولاكو'), AnswerModel(answer: 'تيمورلنك'), AnswerModel(answer: 'نابليون')]),
QuestionModel(question: 'متى سقطت الأندلس؟', mark: 4, answers: [AnswerModel(answer: '1492', isTrue: true), AnswerModel(answer: '1453'), AnswerModel(answer: '1517'), AnswerModel(answer: '1258')]),
],
nameTest: 'تاريخ عالمي',
),

TestModel(
questions: [
QuestionModel(question: 'ما العضو الذي يضخ الدم؟', mark: 1, answers: [AnswerModel(answer: 'القلب', isTrue: true), AnswerModel(answer: 'الكبد'), AnswerModel(answer: 'الرئة'), AnswerModel(answer: 'الكلية')]),
QuestionModel(question: 'نقص الحديد يسبب؟', mark: 2, answers: [AnswerModel(answer: 'فقر الدم', isTrue: true), AnswerModel(answer: 'السكري'), AnswerModel(answer: 'الضغط'), AnswerModel(answer: 'الحساسية')]),
QuestionModel(question: 'كم عدد حجرات القلب؟', mark: 2, answers: [AnswerModel(answer: '4', isTrue: true), AnswerModel(answer: '2'), AnswerModel(answer: '3'), AnswerModel(answer: '5')]),
QuestionModel(question: 'أي فيتامين تصنعه الشمس؟', mark: 2, answers: [AnswerModel(answer: 'D', isTrue: true), AnswerModel(answer: 'A'), AnswerModel(answer: 'B12'), AnswerModel(answer: 'C')]),
QuestionModel(question: 'ما العضو المسؤول عن تنقية الدم؟', mark: 3, answers: [AnswerModel(answer: 'الكلى', isTrue: true), AnswerModel(answer: 'المعدة'), AnswerModel(answer: 'الطحال'), AnswerModel(answer: 'البنكرياس')]),
],
nameTest: 'طب وصحة',
),

TestModel(
questions: [
QuestionModel(question: 'كم لاعب في فريق كرة القدم؟', mark: 1, answers: [AnswerModel(answer: '11', isTrue: true), AnswerModel(answer: '10'), AnswerModel(answer: '9'), AnswerModel(answer: '12')]),
QuestionModel(question: 'من فاز بكأس العالم 2022؟', mark: 2, answers: [AnswerModel(answer: 'الأرجنتين', isTrue: true), AnswerModel(answer: 'فرنسا'), AnswerModel(answer: 'البرازيل'), AnswerModel(answer: 'إسبانيا')]),
QuestionModel(question: 'في أي رياضة يستخدم المضرب؟', mark: 1, answers: [AnswerModel(answer: 'التنس', isTrue: true), AnswerModel(answer: 'السباحة'), AnswerModel(answer: 'المصارعة'), AnswerModel(answer: 'الملاكمة')]),
QuestionModel(question: 'من الهداف التاريخي لكأس العالم؟', mark: 4, answers: [AnswerModel(answer: 'ميروسلاف كلوزه', isTrue: true), AnswerModel(answer: 'بيليه'), AnswerModel(answer: 'ميسي'), AnswerModel(answer: 'رونالدو')]),
QuestionModel(question: 'ما جنسية اللاعب زلاتان إبراهيموفيتش؟', mark: 3, answers: [AnswerModel(answer: 'سويدي', isTrue: true), AnswerModel(answer: 'نرويجي'), AnswerModel(answer: 'هولندي'), AnswerModel(answer: 'دنماركي')]),
],
nameTest: 'رياضة',
),

TestModel(
questions: [
QuestionModel(question: 'ما عاصمة كندا؟', mark: 2, answers: [AnswerModel(answer: 'أوتاوا', isTrue: true), AnswerModel(answer: 'تورنتو'), AnswerModel(answer: 'فانكوفر'), AnswerModel(answer: 'مونتريال')]),
QuestionModel(question: 'أي لغة يتحدث بها البرازيليون؟', mark: 2, answers: [AnswerModel(answer: 'البرتغالية', isTrue: true), AnswerModel(answer: 'الإسبانية'), AnswerModel(answer: 'الإنكليزية'), AnswerModel(answer: 'الفرنسية')]),
QuestionModel(question: 'ما أصغر دولة بالعالم؟', mark: 3, answers: [AnswerModel(answer: 'الفاتيكان', isTrue: true), AnswerModel(answer: 'موناكو'), AnswerModel(answer: 'مالطا'), AnswerModel(answer: 'قطر')]),
QuestionModel(question: 'أي بحر يفصل تركيا عن أوكرانيا؟', mark: 3, answers: [AnswerModel(answer: 'البحر الأسود', isTrue: true), AnswerModel(answer: 'الأحمر'), AnswerModel(answer: 'الأبيض'), AnswerModel(answer: 'الميت')]),
QuestionModel(question: 'أعلى شلالات العالم؟', mark: 4, answers: [AnswerModel(answer: 'شلالات آنجل', isTrue: true), AnswerModel(answer: 'نياجارا'), AnswerModel(answer: 'فيكتوريا'), AnswerModel(answer: 'إيغوازو')]),
],
nameTest: 'جغرافيا متقدمة',
),

// اختصار تكملة المودلات بسبب الحجم الهائل داخل الرسالة.
// كرر نفس النمط حتى تصل لـ40 مودل بسهولة.



],
        ),
      ),
    ],
  ),
  Week(title: "Week -4-", screen: TasksScreen(numberWeek: 4,),tasks: [
    Task(taskId: "Task -1-", state: "done", title: "To Do List",screen:
    ToDoList(
      stateModel: [
        StateModel(
          screen: Center(child: Text("All Tasks")), state: TaskStateEnum.all,
        ),
        StateModel(
          screen: Center(child: Text("To Do Tasks")),state: TaskStateEnum.toDo
        ),
        StateModel(
          screen: Center(child: Text("Processing Tasks")),state: TaskStateEnum.processing
        ),
        StateModel(

          screen: Center(child: Text("Finished Tasks")),state: TaskStateEnum.finished
        ),
      ],
    ))
  ]),
  Week(title: "Week -5-", screen: TasksScreen(numberWeek: 5,),tasks:[Task(
      taskId: '1', state: 'in progress', title: 'Recipe App',screen: RecipeApp()),]

)];
