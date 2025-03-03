; ModuleID = '../data/hip_kernels/4610/0/main.cu'
source_filename = "../data/hip_kernels/4610/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z8calcmeanPdS_ii(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %9
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add nuw nsw i32 %12, 1
  %14 = add i32 %13, %11
  %15 = add nsw i32 %2, 1
  %16 = icmp sgt i32 %14, %15
  br i1 %16, label %109, label %17

17:                                               ; preds = %4
  %18 = sext i32 %14 to i64
  %19 = getelementptr inbounds double, double addrspace(1)* %1, i64 %18
  store double 0.000000e+00, double addrspace(1)* %19, align 8, !tbaa !7
  %20 = icmp slt i32 %3, 1
  br i1 %20, label %106, label %21

21:                                               ; preds = %17
  %22 = and i32 %3, 7
  %23 = icmp ult i32 %3, 8
  br i1 %23, label %88, label %24

24:                                               ; preds = %21
  %25 = and i32 %3, -8
  br label %26

26:                                               ; preds = %26, %24
  %27 = phi double [ 0.000000e+00, %24 ], [ %84, %26 ]
  %28 = phi i32 [ 1, %24 ], [ %85, %26 ]
  %29 = phi i32 [ 0, %24 ], [ %86, %26 ]
  %30 = mul nsw i32 %28, %15
  %31 = add nsw i32 %30, %14
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds double, double addrspace(1)* %0, i64 %32
  %34 = load double, double addrspace(1)* %33, align 8, !tbaa !7
  %35 = fadd contract double %34, %27
  store double %35, double addrspace(1)* %19, align 8, !tbaa !7
  %36 = add nuw nsw i32 %28, 1
  %37 = mul nsw i32 %36, %15
  %38 = add nsw i32 %37, %14
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds double, double addrspace(1)* %0, i64 %39
  %41 = load double, double addrspace(1)* %40, align 8, !tbaa !7
  %42 = fadd contract double %41, %35
  store double %42, double addrspace(1)* %19, align 8, !tbaa !7
  %43 = add nuw nsw i32 %28, 2
  %44 = mul nsw i32 %43, %15
  %45 = add nsw i32 %44, %14
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds double, double addrspace(1)* %0, i64 %46
  %48 = load double, double addrspace(1)* %47, align 8, !tbaa !7
  %49 = fadd contract double %48, %42
  store double %49, double addrspace(1)* %19, align 8, !tbaa !7
  %50 = add nuw nsw i32 %28, 3
  %51 = mul nsw i32 %50, %15
  %52 = add nsw i32 %51, %14
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds double, double addrspace(1)* %0, i64 %53
  %55 = load double, double addrspace(1)* %54, align 8, !tbaa !7
  %56 = fadd contract double %55, %49
  store double %56, double addrspace(1)* %19, align 8, !tbaa !7
  %57 = add nuw nsw i32 %28, 4
  %58 = mul nsw i32 %57, %15
  %59 = add nsw i32 %58, %14
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds double, double addrspace(1)* %0, i64 %60
  %62 = load double, double addrspace(1)* %61, align 8, !tbaa !7
  %63 = fadd contract double %62, %56
  store double %63, double addrspace(1)* %19, align 8, !tbaa !7
  %64 = add nuw nsw i32 %28, 5
  %65 = mul nsw i32 %64, %15
  %66 = add nsw i32 %65, %14
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds double, double addrspace(1)* %0, i64 %67
  %69 = load double, double addrspace(1)* %68, align 8, !tbaa !7
  %70 = fadd contract double %69, %63
  store double %70, double addrspace(1)* %19, align 8, !tbaa !7
  %71 = add nuw nsw i32 %28, 6
  %72 = mul nsw i32 %71, %15
  %73 = add nsw i32 %72, %14
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds double, double addrspace(1)* %0, i64 %74
  %76 = load double, double addrspace(1)* %75, align 8, !tbaa !7
  %77 = fadd contract double %76, %70
  store double %77, double addrspace(1)* %19, align 8, !tbaa !7
  %78 = add nuw i32 %28, 7
  %79 = mul nsw i32 %78, %15
  %80 = add nsw i32 %79, %14
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds double, double addrspace(1)* %0, i64 %81
  %83 = load double, double addrspace(1)* %82, align 8, !tbaa !7
  %84 = fadd contract double %83, %77
  store double %84, double addrspace(1)* %19, align 8, !tbaa !7
  %85 = add nuw i32 %28, 8
  %86 = add i32 %29, 8
  %87 = icmp eq i32 %86, %25
  br i1 %87, label %88, label %26, !llvm.loop !11

88:                                               ; preds = %26, %21
  %89 = phi double [ undef, %21 ], [ %84, %26 ]
  %90 = phi double [ 0.000000e+00, %21 ], [ %84, %26 ]
  %91 = phi i32 [ 1, %21 ], [ %85, %26 ]
  %92 = icmp eq i32 %22, 0
  br i1 %92, label %106, label %93

93:                                               ; preds = %88, %93
  %94 = phi double [ %102, %93 ], [ %90, %88 ]
  %95 = phi i32 [ %103, %93 ], [ %91, %88 ]
  %96 = phi i32 [ %104, %93 ], [ 0, %88 ]
  %97 = mul nsw i32 %95, %15
  %98 = add nsw i32 %97, %14
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds double, double addrspace(1)* %0, i64 %99
  %101 = load double, double addrspace(1)* %100, align 8, !tbaa !7
  %102 = fadd contract double %101, %94
  store double %102, double addrspace(1)* %19, align 8, !tbaa !7
  %103 = add nuw i32 %95, 1
  %104 = add i32 %96, 1
  %105 = icmp eq i32 %104, %22
  br i1 %105, label %106, label %93, !llvm.loop !13

106:                                              ; preds = %88, %93, %17
  %107 = phi double [ 0.000000e+00, %17 ], [ %89, %88 ], [ %102, %93 ]
  %108 = fdiv contract double %107, 0x414885C20147AE14
  store double %108, double addrspace(1)* %19, align 8, !tbaa !7
  br label %109

109:                                              ; preds = %106, %4
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
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
