; ModuleID = '../data/hip_kernels/11810/48/main.cu'
source_filename = "../data/hip_kernels/11810/48/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20ConditionCFLKernel1DPdS_S_iiS_S_(double addrspace(1)* nocapture readnone %0, double addrspace(1)* nocapture readnone %1, double addrspace(1)* nocapture readnone %2, i32 %3, i32 %4, double addrspace(1)* nocapture readonly %5, double addrspace(1)* nocapture %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = mul i32 %14, %13
  %16 = add i32 %15, %8
  %17 = icmp slt i32 %16, %3
  br i1 %17, label %18, label %103

18:                                               ; preds = %7
  %19 = sext i32 %16 to i64
  %20 = getelementptr inbounds double, double addrspace(1)* %6, i64 %19
  store double 0.000000e+00, double addrspace(1)* %20, align 8, !tbaa !7
  %21 = icmp sgt i32 %4, 0
  br i1 %21, label %22, label %99

22:                                               ; preds = %18
  %23 = mul nsw i32 %16, %4
  %24 = and i32 %4, 7
  %25 = icmp ult i32 %4, 8
  br i1 %25, label %82, label %26

26:                                               ; preds = %22
  %27 = and i32 %4, -8
  br label %28

28:                                               ; preds = %28, %26
  %29 = phi double [ 0.000000e+00, %26 ], [ %78, %28 ]
  %30 = phi i32 [ 0, %26 ], [ %79, %28 ]
  %31 = phi i32 [ 0, %26 ], [ %80, %28 ]
  %32 = add nsw i32 %30, %23
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds double, double addrspace(1)* %5, i64 %33
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !7
  %36 = fadd contract double %35, %29
  store double %36, double addrspace(1)* %20, align 8, !tbaa !7
  %37 = or i32 %30, 1
  %38 = add nsw i32 %37, %23
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds double, double addrspace(1)* %5, i64 %39
  %41 = load double, double addrspace(1)* %40, align 8, !tbaa !7
  %42 = fadd contract double %41, %36
  store double %42, double addrspace(1)* %20, align 8, !tbaa !7
  %43 = or i32 %30, 2
  %44 = add nsw i32 %43, %23
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds double, double addrspace(1)* %5, i64 %45
  %47 = load double, double addrspace(1)* %46, align 8, !tbaa !7
  %48 = fadd contract double %47, %42
  store double %48, double addrspace(1)* %20, align 8, !tbaa !7
  %49 = or i32 %30, 3
  %50 = add nsw i32 %49, %23
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds double, double addrspace(1)* %5, i64 %51
  %53 = load double, double addrspace(1)* %52, align 8, !tbaa !7
  %54 = fadd contract double %53, %48
  store double %54, double addrspace(1)* %20, align 8, !tbaa !7
  %55 = or i32 %30, 4
  %56 = add nsw i32 %55, %23
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds double, double addrspace(1)* %5, i64 %57
  %59 = load double, double addrspace(1)* %58, align 8, !tbaa !7
  %60 = fadd contract double %59, %54
  store double %60, double addrspace(1)* %20, align 8, !tbaa !7
  %61 = or i32 %30, 5
  %62 = add nsw i32 %61, %23
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds double, double addrspace(1)* %5, i64 %63
  %65 = load double, double addrspace(1)* %64, align 8, !tbaa !7
  %66 = fadd contract double %65, %60
  store double %66, double addrspace(1)* %20, align 8, !tbaa !7
  %67 = or i32 %30, 6
  %68 = add nsw i32 %67, %23
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds double, double addrspace(1)* %5, i64 %69
  %71 = load double, double addrspace(1)* %70, align 8, !tbaa !7
  %72 = fadd contract double %71, %66
  store double %72, double addrspace(1)* %20, align 8, !tbaa !7
  %73 = or i32 %30, 7
  %74 = add nsw i32 %73, %23
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds double, double addrspace(1)* %5, i64 %75
  %77 = load double, double addrspace(1)* %76, align 8, !tbaa !7
  %78 = fadd contract double %77, %72
  store double %78, double addrspace(1)* %20, align 8, !tbaa !7
  %79 = add nuw nsw i32 %30, 8
  %80 = add i32 %31, 8
  %81 = icmp eq i32 %80, %27
  br i1 %81, label %82, label %28, !llvm.loop !11

82:                                               ; preds = %28, %22
  %83 = phi double [ undef, %22 ], [ %78, %28 ]
  %84 = phi double [ 0.000000e+00, %22 ], [ %78, %28 ]
  %85 = phi i32 [ 0, %22 ], [ %79, %28 ]
  %86 = icmp eq i32 %24, 0
  br i1 %86, label %99, label %87

87:                                               ; preds = %82, %87
  %88 = phi double [ %95, %87 ], [ %84, %82 ]
  %89 = phi i32 [ %96, %87 ], [ %85, %82 ]
  %90 = phi i32 [ %97, %87 ], [ 0, %82 ]
  %91 = add nsw i32 %89, %23
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds double, double addrspace(1)* %5, i64 %92
  %94 = load double, double addrspace(1)* %93, align 8, !tbaa !7
  %95 = fadd contract double %94, %88
  store double %95, double addrspace(1)* %20, align 8, !tbaa !7
  %96 = add nuw nsw i32 %89, 1
  %97 = add i32 %90, 1
  %98 = icmp eq i32 %97, %24
  br i1 %98, label %99, label %87, !llvm.loop !13

99:                                               ; preds = %82, %87, %18
  %100 = phi double [ 0.000000e+00, %18 ], [ %83, %82 ], [ %95, %87 ]
  %101 = sitofp i32 %4 to double
  %102 = fdiv contract double %100, %101
  store double %102, double addrspace(1)* %20, align 8, !tbaa !7
  br label %103

103:                                              ; preds = %99, %7
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
