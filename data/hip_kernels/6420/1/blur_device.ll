; ModuleID = '../data/hip_kernels/6420/1/main.cu'
source_filename = "../data/hip_kernels/6420/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z4blurPhiiiii(i8 addrspace(1)* nocapture %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, %11
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = mul nsw i32 %15, %1
  %17 = sdiv i32 %16, %5
  %18 = add nsw i32 %5, -1
  %19 = icmp eq i32 %15, %18
  br i1 %19, label %24, label %20

20:                                               ; preds = %6
  %21 = add nsw i32 %15, 1
  %22 = mul nsw i32 %21, %1
  %23 = sdiv i32 %22, %5
  br label %24

24:                                               ; preds = %6, %20
  %25 = phi i32 [ %23, %20 ], [ %1, %6 ]
  %26 = sdiv i32 %4, 2
  %27 = icmp slt i32 %17, %25
  br i1 %27, label %28, label %133

28:                                               ; preds = %24
  %29 = icmp sgt i32 %2, 0
  %30 = add i32 %17, %26
  br label %31

31:                                               ; preds = %28, %40
  %32 = phi i32 [ %30, %28 ], [ %34, %40 ]
  %33 = phi i32 [ %17, %28 ], [ %41, %40 ]
  %34 = add i32 %32, 1
  br i1 %29, label %35, label %40

35:                                               ; preds = %31
  %36 = sub nsw i32 %33, %26
  %37 = add nsw i32 %33, %26
  %38 = icmp sgt i32 %36, %37
  %39 = mul nsw i32 %33, %2
  br label %43

40:                                               ; preds = %51, %31
  %41 = add nsw i32 %33, 1
  %42 = icmp slt i32 %41, %25
  br i1 %42, label %31, label %133, !llvm.loop !7

43:                                               ; preds = %35, %51
  %44 = phi i32 [ %26, %35 ], [ %46, %51 ]
  %45 = phi i32 [ 0, %35 ], [ %75, %51 ]
  %46 = add i32 %44, 1
  br i1 %38, label %51, label %47

47:                                               ; preds = %43
  %48 = sub nsw i32 %45, %26
  %49 = add nsw i32 %45, %26
  %50 = icmp sgt i32 %48, %49
  br label %77

51:                                               ; preds = %88, %43
  %52 = phi i32 [ 0, %43 ], [ %89, %88 ]
  %53 = phi i32 [ 0, %43 ], [ %90, %88 ]
  %54 = phi i32 [ 0, %43 ], [ %91, %88 ]
  %55 = phi double [ 0.000000e+00, %43 ], [ %92, %88 ]
  %56 = uitofp i32 %52 to double
  %57 = fdiv contract double %56, %55
  %58 = fptoui double %57 to i8
  %59 = add i32 %45, %39
  %60 = mul i32 %59, %3
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %61
  store i8 %58, i8 addrspace(1)* %62, align 1, !tbaa !9
  %63 = uitofp i32 %54 to double
  %64 = fdiv contract double %63, %55
  %65 = fptoui double %64 to i8
  %66 = add nsw i32 %60, 1
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %67
  store i8 %65, i8 addrspace(1)* %68, align 1, !tbaa !9
  %69 = uitofp i32 %53 to double
  %70 = fdiv contract double %69, %55
  %71 = fptoui double %70 to i8
  %72 = add nsw i32 %60, 2
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %73
  store i8 %71, i8 addrspace(1)* %74, align 1, !tbaa !9
  %75 = add nuw nsw i32 %45, 1
  %76 = icmp eq i32 %75, %2
  br i1 %76, label %40, label %43, !llvm.loop !12

77:                                               ; preds = %47, %88
  %78 = phi i32 [ %36, %47 ], [ %93, %88 ]
  %79 = phi double [ 0.000000e+00, %47 ], [ %92, %88 ]
  %80 = phi i32 [ 0, %47 ], [ %91, %88 ]
  %81 = phi i32 [ 0, %47 ], [ %90, %88 ]
  %82 = phi i32 [ 0, %47 ], [ %89, %88 ]
  br i1 %50, label %88, label %83

83:                                               ; preds = %77
  %84 = icmp slt i32 %78, %1
  %85 = icmp sgt i32 %78, -1
  %86 = and i1 %84, %85
  %87 = mul nsw i32 %78, %2
  br label %95

88:                                               ; preds = %126, %77
  %89 = phi i32 [ %82, %77 ], [ %127, %126 ]
  %90 = phi i32 [ %81, %77 ], [ %128, %126 ]
  %91 = phi i32 [ %80, %77 ], [ %129, %126 ]
  %92 = phi double [ %79, %77 ], [ %130, %126 ]
  %93 = add i32 %78, 1
  %94 = icmp eq i32 %78, %32
  br i1 %94, label %51, label %77, !llvm.loop !13

95:                                               ; preds = %83, %126
  %96 = phi i32 [ %48, %83 ], [ %131, %126 ]
  %97 = phi double [ %79, %83 ], [ %130, %126 ]
  %98 = phi i32 [ %80, %83 ], [ %129, %126 ]
  %99 = phi i32 [ %81, %83 ], [ %128, %126 ]
  %100 = phi i32 [ %82, %83 ], [ %127, %126 ]
  br i1 %86, label %101, label %126

101:                                              ; preds = %95
  %102 = icmp slt i32 %96, %2
  %103 = icmp sgt i32 %96, -1
  %104 = and i1 %102, %103
  br i1 %104, label %105, label %126

105:                                              ; preds = %101
  %106 = fadd contract double %97, 1.000000e+00
  %107 = add i32 %96, %87
  %108 = mul i32 %107, %3
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %109
  %111 = load i8, i8 addrspace(1)* %110, align 1, !tbaa !9
  %112 = zext i8 %111 to i32
  %113 = add i32 %100, %112
  %114 = add nsw i32 %108, 1
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %115
  %117 = load i8, i8 addrspace(1)* %116, align 1, !tbaa !9
  %118 = zext i8 %117 to i32
  %119 = add i32 %98, %118
  %120 = add nsw i32 %108, 2
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %121
  %123 = load i8, i8 addrspace(1)* %122, align 1, !tbaa !9
  %124 = zext i8 %123 to i32
  %125 = add i32 %99, %124
  br label %126

126:                                              ; preds = %95, %101, %105
  %127 = phi i32 [ %113, %105 ], [ %100, %101 ], [ %100, %95 ]
  %128 = phi i32 [ %125, %105 ], [ %99, %101 ], [ %99, %95 ]
  %129 = phi i32 [ %119, %105 ], [ %98, %101 ], [ %98, %95 ]
  %130 = phi double [ %106, %105 ], [ %97, %101 ], [ %97, %95 ]
  %131 = add i32 %96, 1
  %132 = icmp eq i32 %96, %44
  br i1 %132, label %88, label %95, !llvm.loop !14

133:                                              ; preds = %40, %24
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!10, !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C++ TBAA"}
!12 = distinct !{!12, !8}
!13 = distinct !{!13, !8}
!14 = distinct !{!14, !8}
