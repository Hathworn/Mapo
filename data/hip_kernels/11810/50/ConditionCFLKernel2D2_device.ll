; ModuleID = '../data/hip_kernels/11810/50/main.cu'
source_filename = "../data/hip_kernels/11810/50/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z21ConditionCFLKernel2D2PdS_S_S_S_Piiid(double addrspace(1)* nocapture %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture writeonly %2, double addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readnone %5, i32 %6, i32 %7, double %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !5, !invariant.load !6
  %15 = zext i16 %14 to i32
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = mul i32 %16, %15
  %18 = add i32 %17, %10
  %19 = icmp sgt i32 %18, 0
  %20 = icmp slt i32 %18, %7
  %21 = select i1 %19, i1 %20, i1 false
  br i1 %21, label %22, label %129

22:                                               ; preds = %9
  %23 = zext i32 %18 to i64
  %24 = getelementptr inbounds double, double addrspace(1)* %0, i64 %23
  store double 1.000000e+30, double addrspace(1)* %24, align 8, !tbaa !7
  %25 = icmp sgt i32 %6, 0
  br i1 %25, label %26, label %129

26:                                               ; preds = %22
  %27 = mul nsw i32 %18, %6
  %28 = and i32 %6, 7
  %29 = icmp ult i32 %6, 8
  br i1 %29, label %110, label %30

30:                                               ; preds = %26
  %31 = and i32 %6, -8
  br label %32

32:                                               ; preds = %105, %30
  %33 = phi double [ 1.000000e+30, %30 ], [ %106, %105 ]
  %34 = phi i32 [ 0, %30 ], [ %107, %105 ]
  %35 = phi i32 [ 0, %30 ], [ %108, %105 ]
  %36 = add nsw i32 %34, %27
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds double, double addrspace(1)* %1, i64 %37
  %39 = load double, double addrspace(1)* %38, align 8, !tbaa !7
  %40 = fcmp contract olt double %39, %33
  br i1 %40, label %41, label %42

41:                                               ; preds = %32
  store double %39, double addrspace(1)* %24, align 8, !tbaa !7
  br label %42

42:                                               ; preds = %32, %41
  %43 = phi double [ %33, %32 ], [ %39, %41 ]
  %44 = or i32 %34, 1
  %45 = add nsw i32 %44, %27
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds double, double addrspace(1)* %1, i64 %46
  %48 = load double, double addrspace(1)* %47, align 8, !tbaa !7
  %49 = fcmp contract olt double %48, %43
  br i1 %49, label %50, label %51

50:                                               ; preds = %42
  store double %48, double addrspace(1)* %24, align 8, !tbaa !7
  br label %51

51:                                               ; preds = %50, %42
  %52 = phi double [ %43, %42 ], [ %48, %50 ]
  %53 = or i32 %34, 2
  %54 = add nsw i32 %53, %27
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds double, double addrspace(1)* %1, i64 %55
  %57 = load double, double addrspace(1)* %56, align 8, !tbaa !7
  %58 = fcmp contract olt double %57, %52
  br i1 %58, label %59, label %60

59:                                               ; preds = %51
  store double %57, double addrspace(1)* %24, align 8, !tbaa !7
  br label %60

60:                                               ; preds = %59, %51
  %61 = phi double [ %52, %51 ], [ %57, %59 ]
  %62 = or i32 %34, 3
  %63 = add nsw i32 %62, %27
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds double, double addrspace(1)* %1, i64 %64
  %66 = load double, double addrspace(1)* %65, align 8, !tbaa !7
  %67 = fcmp contract olt double %66, %61
  br i1 %67, label %68, label %69

68:                                               ; preds = %60
  store double %66, double addrspace(1)* %24, align 8, !tbaa !7
  br label %69

69:                                               ; preds = %68, %60
  %70 = phi double [ %61, %60 ], [ %66, %68 ]
  %71 = or i32 %34, 4
  %72 = add nsw i32 %71, %27
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds double, double addrspace(1)* %1, i64 %73
  %75 = load double, double addrspace(1)* %74, align 8, !tbaa !7
  %76 = fcmp contract olt double %75, %70
  br i1 %76, label %77, label %78

77:                                               ; preds = %69
  store double %75, double addrspace(1)* %24, align 8, !tbaa !7
  br label %78

78:                                               ; preds = %77, %69
  %79 = phi double [ %70, %69 ], [ %75, %77 ]
  %80 = or i32 %34, 5
  %81 = add nsw i32 %80, %27
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds double, double addrspace(1)* %1, i64 %82
  %84 = load double, double addrspace(1)* %83, align 8, !tbaa !7
  %85 = fcmp contract olt double %84, %79
  br i1 %85, label %86, label %87

86:                                               ; preds = %78
  store double %84, double addrspace(1)* %24, align 8, !tbaa !7
  br label %87

87:                                               ; preds = %86, %78
  %88 = phi double [ %79, %78 ], [ %84, %86 ]
  %89 = or i32 %34, 6
  %90 = add nsw i32 %89, %27
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds double, double addrspace(1)* %1, i64 %91
  %93 = load double, double addrspace(1)* %92, align 8, !tbaa !7
  %94 = fcmp contract olt double %93, %88
  br i1 %94, label %95, label %96

95:                                               ; preds = %87
  store double %93, double addrspace(1)* %24, align 8, !tbaa !7
  br label %96

96:                                               ; preds = %95, %87
  %97 = phi double [ %88, %87 ], [ %93, %95 ]
  %98 = or i32 %34, 7
  %99 = add nsw i32 %98, %27
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds double, double addrspace(1)* %1, i64 %100
  %102 = load double, double addrspace(1)* %101, align 8, !tbaa !7
  %103 = fcmp contract olt double %102, %97
  br i1 %103, label %104, label %105

104:                                              ; preds = %96
  store double %102, double addrspace(1)* %24, align 8, !tbaa !7
  br label %105

105:                                              ; preds = %104, %96
  %106 = phi double [ %97, %96 ], [ %102, %104 ]
  %107 = add nuw nsw i32 %34, 8
  %108 = add i32 %35, 8
  %109 = icmp eq i32 %108, %31
  br i1 %109, label %110, label %32, !llvm.loop !11

110:                                              ; preds = %105, %26
  %111 = phi double [ 1.000000e+30, %26 ], [ %106, %105 ]
  %112 = phi i32 [ 0, %26 ], [ %107, %105 ]
  %113 = icmp eq i32 %28, 0
  br i1 %113, label %129, label %114

114:                                              ; preds = %110, %124
  %115 = phi double [ %125, %124 ], [ %111, %110 ]
  %116 = phi i32 [ %126, %124 ], [ %112, %110 ]
  %117 = phi i32 [ %127, %124 ], [ 0, %110 ]
  %118 = add nsw i32 %116, %27
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds double, double addrspace(1)* %1, i64 %119
  %121 = load double, double addrspace(1)* %120, align 8, !tbaa !7
  %122 = fcmp contract olt double %121, %115
  br i1 %122, label %123, label %124

123:                                              ; preds = %114
  store double %121, double addrspace(1)* %24, align 8, !tbaa !7
  br label %124

124:                                              ; preds = %123, %114
  %125 = phi double [ %115, %114 ], [ %121, %123 ]
  %126 = add nuw nsw i32 %116, 1
  %127 = add i32 %117, 1
  %128 = icmp eq i32 %127, %28
  br i1 %128, label %129, label %114, !llvm.loop !13

129:                                              ; preds = %110, %124, %22, %9
  %130 = add nsw i32 %7, -1
  %131 = icmp slt i32 %18, %130
  br i1 %131, label %132, label %152

132:                                              ; preds = %129
  %133 = sitofp i32 %6 to double
  %134 = fdiv contract double 0x400921FB54442D18, %133
  %135 = sext i32 %18 to i64
  %136 = getelementptr inbounds double, double addrspace(1)* %3, i64 %135
  %137 = load double, double addrspace(1)* %136, align 8, !tbaa !7
  %138 = getelementptr inbounds double, double addrspace(1)* %4, i64 %135
  %139 = load double, double addrspace(1)* %138, align 8, !tbaa !7
  %140 = fmul contract double %137, %139
  %141 = add nsw i32 %18, 1
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds double, double addrspace(1)* %3, i64 %142
  %144 = load double, double addrspace(1)* %143, align 8, !tbaa !7
  %145 = getelementptr inbounds double, double addrspace(1)* %4, i64 %142
  %146 = load double, double addrspace(1)* %145, align 8, !tbaa !7
  %147 = fmul contract double %144, %146
  %148 = fsub contract double %140, %147
  %149 = tail call double @llvm.fabs.f64(double %148)
  %150 = fdiv contract double %134, %149
  %151 = getelementptr inbounds double, double addrspace(1)* %2, i64 %135
  store double %150, double addrspace(1)* %151, align 8, !tbaa !7
  br label %152

152:                                              ; preds = %132, %129
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
