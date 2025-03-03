; ModuleID = '../data/hip_kernels/2482/2/main.cu'
source_filename = "../data/hip_kernels/2482/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z8vecAdd_2PdS_S_i(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = icmp sgt i32 %3, 0
  br i1 %5, label %6, label %30

6:                                                ; preds = %4
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = mul nsw i32 %7, %3
  %9 = and i32 %3, 7
  %10 = icmp ult i32 %3, 8
  br i1 %10, label %13, label %11

11:                                               ; preds = %6
  %12 = and i32 %3, -8
  br label %31

13:                                               ; preds = %31, %6
  %14 = phi i32 [ 0, %6 ], [ %105, %31 ]
  %15 = icmp eq i32 %9, 0
  br i1 %15, label %30, label %16

16:                                               ; preds = %13, %16
  %17 = phi i32 [ %27, %16 ], [ %14, %13 ]
  %18 = phi i32 [ %28, %16 ], [ 0, %13 ]
  %19 = add nsw i32 %17, %8
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds double, double addrspace(1)* %0, i64 %20
  %22 = load double, double addrspace(1)* %21, align 8, !tbaa !5
  %23 = getelementptr inbounds double, double addrspace(1)* %1, i64 %20
  %24 = load double, double addrspace(1)* %23, align 8, !tbaa !5
  %25 = fadd contract double %22, %24
  %26 = getelementptr inbounds double, double addrspace(1)* %2, i64 %20
  store double %25, double addrspace(1)* %26, align 8, !tbaa !5
  %27 = add nuw nsw i32 %17, 1
  %28 = add i32 %18, 1
  %29 = icmp eq i32 %28, %9
  br i1 %29, label %30, label %16, !llvm.loop !9

30:                                               ; preds = %13, %16, %4
  ret void

31:                                               ; preds = %31, %11
  %32 = phi i32 [ 0, %11 ], [ %105, %31 ]
  %33 = phi i32 [ 0, %11 ], [ %106, %31 ]
  %34 = add nsw i32 %32, %8
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds double, double addrspace(1)* %0, i64 %35
  %37 = load double, double addrspace(1)* %36, align 8, !tbaa !5
  %38 = getelementptr inbounds double, double addrspace(1)* %1, i64 %35
  %39 = load double, double addrspace(1)* %38, align 8, !tbaa !5
  %40 = fadd contract double %37, %39
  %41 = getelementptr inbounds double, double addrspace(1)* %2, i64 %35
  store double %40, double addrspace(1)* %41, align 8, !tbaa !5
  %42 = or i32 %32, 1
  %43 = add nsw i32 %42, %8
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds double, double addrspace(1)* %0, i64 %44
  %46 = load double, double addrspace(1)* %45, align 8, !tbaa !5
  %47 = getelementptr inbounds double, double addrspace(1)* %1, i64 %44
  %48 = load double, double addrspace(1)* %47, align 8, !tbaa !5
  %49 = fadd contract double %46, %48
  %50 = getelementptr inbounds double, double addrspace(1)* %2, i64 %44
  store double %49, double addrspace(1)* %50, align 8, !tbaa !5
  %51 = or i32 %32, 2
  %52 = add nsw i32 %51, %8
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds double, double addrspace(1)* %0, i64 %53
  %55 = load double, double addrspace(1)* %54, align 8, !tbaa !5
  %56 = getelementptr inbounds double, double addrspace(1)* %1, i64 %53
  %57 = load double, double addrspace(1)* %56, align 8, !tbaa !5
  %58 = fadd contract double %55, %57
  %59 = getelementptr inbounds double, double addrspace(1)* %2, i64 %53
  store double %58, double addrspace(1)* %59, align 8, !tbaa !5
  %60 = or i32 %32, 3
  %61 = add nsw i32 %60, %8
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds double, double addrspace(1)* %0, i64 %62
  %64 = load double, double addrspace(1)* %63, align 8, !tbaa !5
  %65 = getelementptr inbounds double, double addrspace(1)* %1, i64 %62
  %66 = load double, double addrspace(1)* %65, align 8, !tbaa !5
  %67 = fadd contract double %64, %66
  %68 = getelementptr inbounds double, double addrspace(1)* %2, i64 %62
  store double %67, double addrspace(1)* %68, align 8, !tbaa !5
  %69 = or i32 %32, 4
  %70 = add nsw i32 %69, %8
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds double, double addrspace(1)* %0, i64 %71
  %73 = load double, double addrspace(1)* %72, align 8, !tbaa !5
  %74 = getelementptr inbounds double, double addrspace(1)* %1, i64 %71
  %75 = load double, double addrspace(1)* %74, align 8, !tbaa !5
  %76 = fadd contract double %73, %75
  %77 = getelementptr inbounds double, double addrspace(1)* %2, i64 %71
  store double %76, double addrspace(1)* %77, align 8, !tbaa !5
  %78 = or i32 %32, 5
  %79 = add nsw i32 %78, %8
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds double, double addrspace(1)* %0, i64 %80
  %82 = load double, double addrspace(1)* %81, align 8, !tbaa !5
  %83 = getelementptr inbounds double, double addrspace(1)* %1, i64 %80
  %84 = load double, double addrspace(1)* %83, align 8, !tbaa !5
  %85 = fadd contract double %82, %84
  %86 = getelementptr inbounds double, double addrspace(1)* %2, i64 %80
  store double %85, double addrspace(1)* %86, align 8, !tbaa !5
  %87 = or i32 %32, 6
  %88 = add nsw i32 %87, %8
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds double, double addrspace(1)* %0, i64 %89
  %91 = load double, double addrspace(1)* %90, align 8, !tbaa !5
  %92 = getelementptr inbounds double, double addrspace(1)* %1, i64 %89
  %93 = load double, double addrspace(1)* %92, align 8, !tbaa !5
  %94 = fadd contract double %91, %93
  %95 = getelementptr inbounds double, double addrspace(1)* %2, i64 %89
  store double %94, double addrspace(1)* %95, align 8, !tbaa !5
  %96 = or i32 %32, 7
  %97 = add nsw i32 %96, %8
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds double, double addrspace(1)* %0, i64 %98
  %100 = load double, double addrspace(1)* %99, align 8, !tbaa !5
  %101 = getelementptr inbounds double, double addrspace(1)* %1, i64 %98
  %102 = load double, double addrspace(1)* %101, align 8, !tbaa !5
  %103 = fadd contract double %100, %102
  %104 = getelementptr inbounds double, double addrspace(1)* %2, i64 %98
  store double %103, double addrspace(1)* %104, align 8, !tbaa !5
  %105 = add nuw nsw i32 %32, 8
  %106 = add i32 %33, 8
  %107 = icmp eq i32 %106, %12
  br i1 %107, label %13, label %31, !llvm.loop !11
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!5 = !{!6, !6, i64 0}
!6 = !{!"double", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.unroll.disable"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
