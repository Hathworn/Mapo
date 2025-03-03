; ModuleID = '../data/hip_kernels/535/0/main.cu'
source_filename = "../data/hip_kernels/535/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@__const._Z22parallel_passwordCrackiPiS_.alphabetTable = private unnamed_addr addrspace(4) constant [26 x i8] c"abcdefghijklmnopqrstuvwxyz", align 16
@_ZZ22parallel_passwordCrackiPiS_E5nIter = internal unnamed_addr addrspace(3) global i32 undef, align 4
@_ZZ22parallel_passwordCrackiPiS_E3idT = internal unnamed_addr addrspace(3) global i32 undef, align 4
@_ZZ22parallel_passwordCrackiPiS_E12totalAttempt = internal unnamed_addr addrspace(3) global i64 undef, align 8

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z22parallel_passwordCrackiPiS_(i32 %0, i32 addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture readonly %2) local_unnamed_addr #1 {
  %4 = alloca [1000 x i32], align 16, addrspace(5)
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = bitcast [1000 x i32] addrspace(5)* %4 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4000, i8 addrspace(5)* %14) #3
  %15 = icmp eq i32 %13, 0
  %16 = getelementptr inbounds [1000 x i32], [1000 x i32] addrspace(5)* %4, i32 0, i32 0
  %17 = icmp sgt i32 %0, 0
  %18 = icmp slt i32 %0, 1
  %19 = load i32, i32 addrspace(3)* @_ZZ22parallel_passwordCrackiPiS_E5nIter, align 4
  %20 = load i64, i64 addrspace(3)* @_ZZ22parallel_passwordCrackiPiS_E12totalAttempt, align 8, !tbaa !7
  %21 = getelementptr inbounds [1000 x i32], [1000 x i32] addrspace(5)* %4, i32 0, i32 0
  br label %22

22:                                               ; preds = %72, %3
  %23 = phi i64 [ %73, %72 ], [ %20, %3 ]
  %24 = phi i32 [ 0, %72 ], [ %19, %3 ]
  br i1 %15, label %25, label %26

25:                                               ; preds = %22
  store i32 0, i32 addrspace(3)* @_ZZ22parallel_passwordCrackiPiS_E5nIter, align 4, !tbaa !11
  store i64 0, i64 addrspace(3)* @_ZZ22parallel_passwordCrackiPiS_E12totalAttempt, align 8, !tbaa !7
  br label %26

26:                                               ; preds = %25, %22
  %27 = phi i64 [ 0, %25 ], [ %23, %22 ]
  %28 = phi i32 [ 0, %25 ], [ %24, %22 ]
  %29 = load i32, i32 addrspace(5)* %16, align 16, !tbaa !11
  %30 = add nsw i32 %29, 1
  store i32 %30, i32 addrspace(5)* %16, align 16, !tbaa !11
  br i1 %17, label %31, label %48

31:                                               ; preds = %26, %40
  %32 = phi i32 [ %46, %40 ], [ %30, %26 ]
  %33 = phi i32 [ %43, %40 ], [ 0, %26 ]
  %34 = zext i32 %33 to i64
  %35 = getelementptr [26 x i8], [26 x i8] addrspace(4)* @__const._Z22parallel_passwordCrackiPiS_.alphabetTable, i64 0, i64 %34
  %36 = load i8, i8 addrspace(4)* %35, align 1, !tbaa !13
  %37 = sext i8 %36 to i32
  %38 = add nsw i32 %37, 26
  %39 = icmp slt i32 %32, %38
  br i1 %39, label %48, label %40

40:                                               ; preds = %31
  %41 = getelementptr inbounds [1000 x i32], [1000 x i32] addrspace(5)* %4, i32 0, i32 %33
  %42 = add nsw i32 %32, -26
  store i32 %42, i32 addrspace(5)* %41, align 4, !tbaa !11
  %43 = add nuw nsw i32 %33, 1
  %44 = getelementptr inbounds [1000 x i32], [1000 x i32] addrspace(5)* %4, i32 0, i32 %43
  %45 = load i32, i32 addrspace(5)* %44, align 4, !tbaa !11
  %46 = add nsw i32 %45, 1
  store i32 %46, i32 addrspace(5)* %44, align 4, !tbaa !11
  %47 = icmp eq i32 %43, %0
  br i1 %47, label %48, label %31, !llvm.loop !14

48:                                               ; preds = %40, %31, %26
  br i1 %18, label %66, label %49

49:                                               ; preds = %48
  %50 = load i32, i32 addrspace(5)* %21, align 16, !tbaa !11
  %51 = load i32, i32 addrspace(1)* %2, align 4, !tbaa !11, !amdgpu.noclobber !5
  %52 = icmp eq i32 %50, %51
  br i1 %52, label %53, label %66

53:                                               ; preds = %49, %56
  %54 = phi i32 [ %63, %56 ], [ 1, %49 ]
  %55 = icmp eq i32 %54, %0
  br i1 %55, label %64, label %56, !llvm.loop !16

56:                                               ; preds = %53
  %57 = zext i32 %54 to i64
  %58 = getelementptr inbounds [1000 x i32], [1000 x i32] addrspace(5)* %4, i32 0, i32 %54
  %59 = load i32, i32 addrspace(5)* %58, align 4, !tbaa !11
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %57
  %61 = load i32, i32 addrspace(1)* %60, align 4, !tbaa !11, !amdgpu.noclobber !5
  %62 = icmp eq i32 %59, %61
  %63 = add nuw nsw i32 %54, 1
  br i1 %62, label %53, label %64, !llvm.loop !16

64:                                               ; preds = %53, %56
  %65 = icmp sge i32 %54, %0
  br label %66

66:                                               ; preds = %64, %49, %48
  %67 = phi i1 [ true, %48 ], [ false, %49 ], [ %65, %64 ]
  %68 = icmp eq i32 %28, 0
  %69 = select i1 %67, i1 %68, i1 false
  br i1 %69, label %70, label %71

70:                                               ; preds = %66
  store i32 %13, i32 addrspace(3)* @_ZZ22parallel_passwordCrackiPiS_E3idT, align 4, !tbaa !11
  br label %76

71:                                               ; preds = %66
  br i1 %68, label %72, label %74

72:                                               ; preds = %71
  %73 = add nsw i64 %27, 1
  store i64 %73, i64 addrspace(3)* @_ZZ22parallel_passwordCrackiPiS_E12totalAttempt, align 8, !tbaa !7
  br label %22, !llvm.loop !17

74:                                               ; preds = %71
  %75 = load i32, i32 addrspace(3)* @_ZZ22parallel_passwordCrackiPiS_E3idT, align 4, !tbaa !11
  br label %76

76:                                               ; preds = %74, %70
  %77 = phi i32 [ %75, %74 ], [ %13, %70 ]
  %78 = icmp eq i32 %13, %77
  %79 = select i1 %78, i1 %17, i1 false
  br i1 %79, label %80, label %143

80:                                               ; preds = %76
  %81 = and i32 %0, 7
  %82 = icmp ult i32 %0, 8
  br i1 %82, label %130, label %83

83:                                               ; preds = %80
  %84 = and i32 %0, -8
  br label %85

85:                                               ; preds = %85, %83
  %86 = phi i32 [ 0, %83 ], [ %127, %85 ]
  %87 = phi i32 [ 0, %83 ], [ %128, %85 ]
  %88 = zext i32 %86 to i64
  %89 = getelementptr inbounds [1000 x i32], [1000 x i32] addrspace(5)* %4, i32 0, i32 %86
  %90 = load i32, i32 addrspace(5)* %89, align 16, !tbaa !11
  %91 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %88
  store i32 %90, i32 addrspace(1)* %91, align 4, !tbaa !11
  %92 = or i32 %86, 1
  %93 = zext i32 %92 to i64
  %94 = getelementptr inbounds [1000 x i32], [1000 x i32] addrspace(5)* %4, i32 0, i32 %92
  %95 = load i32, i32 addrspace(5)* %94, align 4, !tbaa !11
  %96 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %93
  store i32 %95, i32 addrspace(1)* %96, align 4, !tbaa !11
  %97 = or i32 %86, 2
  %98 = zext i32 %97 to i64
  %99 = getelementptr inbounds [1000 x i32], [1000 x i32] addrspace(5)* %4, i32 0, i32 %97
  %100 = load i32, i32 addrspace(5)* %99, align 8, !tbaa !11
  %101 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %98
  store i32 %100, i32 addrspace(1)* %101, align 4, !tbaa !11
  %102 = or i32 %86, 3
  %103 = zext i32 %102 to i64
  %104 = getelementptr inbounds [1000 x i32], [1000 x i32] addrspace(5)* %4, i32 0, i32 %102
  %105 = load i32, i32 addrspace(5)* %104, align 4, !tbaa !11
  %106 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %103
  store i32 %105, i32 addrspace(1)* %106, align 4, !tbaa !11
  %107 = or i32 %86, 4
  %108 = zext i32 %107 to i64
  %109 = getelementptr inbounds [1000 x i32], [1000 x i32] addrspace(5)* %4, i32 0, i32 %107
  %110 = load i32, i32 addrspace(5)* %109, align 16, !tbaa !11
  %111 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %108
  store i32 %110, i32 addrspace(1)* %111, align 4, !tbaa !11
  %112 = or i32 %86, 5
  %113 = zext i32 %112 to i64
  %114 = getelementptr inbounds [1000 x i32], [1000 x i32] addrspace(5)* %4, i32 0, i32 %112
  %115 = load i32, i32 addrspace(5)* %114, align 4, !tbaa !11
  %116 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %113
  store i32 %115, i32 addrspace(1)* %116, align 4, !tbaa !11
  %117 = or i32 %86, 6
  %118 = zext i32 %117 to i64
  %119 = getelementptr inbounds [1000 x i32], [1000 x i32] addrspace(5)* %4, i32 0, i32 %117
  %120 = load i32, i32 addrspace(5)* %119, align 8, !tbaa !11
  %121 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %118
  store i32 %120, i32 addrspace(1)* %121, align 4, !tbaa !11
  %122 = or i32 %86, 7
  %123 = zext i32 %122 to i64
  %124 = getelementptr inbounds [1000 x i32], [1000 x i32] addrspace(5)* %4, i32 0, i32 %122
  %125 = load i32, i32 addrspace(5)* %124, align 4, !tbaa !11
  %126 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %123
  store i32 %125, i32 addrspace(1)* %126, align 4, !tbaa !11
  %127 = add nuw nsw i32 %86, 8
  %128 = add i32 %87, 8
  %129 = icmp eq i32 %128, %84
  br i1 %129, label %130, label %85, !llvm.loop !18

130:                                              ; preds = %85, %80
  %131 = phi i32 [ 0, %80 ], [ %127, %85 ]
  %132 = icmp eq i32 %81, 0
  br i1 %132, label %143, label %133

133:                                              ; preds = %130, %133
  %134 = phi i32 [ %140, %133 ], [ %131, %130 ]
  %135 = phi i32 [ %141, %133 ], [ 0, %130 ]
  %136 = zext i32 %134 to i64
  %137 = getelementptr inbounds [1000 x i32], [1000 x i32] addrspace(5)* %4, i32 0, i32 %134
  %138 = load i32, i32 addrspace(5)* %137, align 4, !tbaa !11
  %139 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %136
  store i32 %138, i32 addrspace(1)* %139, align 4, !tbaa !11
  %140 = add nuw nsw i32 %134, 1
  %141 = add i32 %135, 1
  %142 = icmp eq i32 %141, %81
  br i1 %142, label %143, label %133, !llvm.loop !19

143:                                              ; preds = %130, %133, %76
  call void @llvm.lifetime.end.p5i8(i64 4000, i8 addrspace(5)* %14) #3
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"long", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
!13 = !{!9, !9, i64 0}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.mustprogress"}
!16 = distinct !{!16, !15}
!17 = distinct !{!17, !15}
!18 = distinct !{!18, !15}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.unroll.disable"}
