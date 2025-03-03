; ModuleID = '../data/hip_kernels/11810/38/main.cu'
source_filename = "../data/hip_kernels/11810/38/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z35ComputeAverageThetaVelocitiesKernelPdS_ii(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = mul i32 %11, %10
  %13 = add i32 %12, %5
  %14 = icmp slt i32 %13, %3
  br i1 %14, label %15, label %100

15:                                               ; preds = %4
  %16 = icmp sgt i32 %2, 0
  br i1 %16, label %17, label %40

17:                                               ; preds = %15
  %18 = mul nsw i32 %13, %2
  %19 = and i32 %2, 7
  %20 = icmp ult i32 %2, 8
  br i1 %20, label %23, label %21

21:                                               ; preds = %17
  %22 = and i32 %2, -8
  br label %46

23:                                               ; preds = %46, %17
  %24 = phi double [ undef, %17 ], [ %96, %46 ]
  %25 = phi i32 [ 0, %17 ], [ %97, %46 ]
  %26 = phi double [ 0.000000e+00, %17 ], [ %96, %46 ]
  %27 = icmp eq i32 %19, 0
  br i1 %27, label %40, label %28

28:                                               ; preds = %23, %28
  %29 = phi i32 [ %37, %28 ], [ %25, %23 ]
  %30 = phi double [ %36, %28 ], [ %26, %23 ]
  %31 = phi i32 [ %38, %28 ], [ 0, %23 ]
  %32 = add nsw i32 %29, %18
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds double, double addrspace(1)* %0, i64 %33
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !7, !amdgpu.noclobber !6
  %36 = fadd contract double %30, %35
  %37 = add nuw nsw i32 %29, 1
  %38 = add i32 %31, 1
  %39 = icmp eq i32 %38, %19
  br i1 %39, label %40, label %28, !llvm.loop !11

40:                                               ; preds = %23, %28, %15
  %41 = phi double [ 0.000000e+00, %15 ], [ %24, %23 ], [ %36, %28 ]
  %42 = sitofp i32 %2 to double
  %43 = fdiv contract double %41, %42
  %44 = sext i32 %13 to i64
  %45 = getelementptr inbounds double, double addrspace(1)* %1, i64 %44
  store double %43, double addrspace(1)* %45, align 8, !tbaa !7
  br label %100

46:                                               ; preds = %46, %21
  %47 = phi i32 [ 0, %21 ], [ %97, %46 ]
  %48 = phi double [ 0.000000e+00, %21 ], [ %96, %46 ]
  %49 = phi i32 [ 0, %21 ], [ %98, %46 ]
  %50 = add nsw i32 %47, %18
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds double, double addrspace(1)* %0, i64 %51
  %53 = load double, double addrspace(1)* %52, align 8, !tbaa !7, !amdgpu.noclobber !6
  %54 = fadd contract double %48, %53
  %55 = or i32 %47, 1
  %56 = add nsw i32 %55, %18
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds double, double addrspace(1)* %0, i64 %57
  %59 = load double, double addrspace(1)* %58, align 8, !tbaa !7, !amdgpu.noclobber !6
  %60 = fadd contract double %54, %59
  %61 = or i32 %47, 2
  %62 = add nsw i32 %61, %18
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds double, double addrspace(1)* %0, i64 %63
  %65 = load double, double addrspace(1)* %64, align 8, !tbaa !7, !amdgpu.noclobber !6
  %66 = fadd contract double %60, %65
  %67 = or i32 %47, 3
  %68 = add nsw i32 %67, %18
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds double, double addrspace(1)* %0, i64 %69
  %71 = load double, double addrspace(1)* %70, align 8, !tbaa !7, !amdgpu.noclobber !6
  %72 = fadd contract double %66, %71
  %73 = or i32 %47, 4
  %74 = add nsw i32 %73, %18
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds double, double addrspace(1)* %0, i64 %75
  %77 = load double, double addrspace(1)* %76, align 8, !tbaa !7, !amdgpu.noclobber !6
  %78 = fadd contract double %72, %77
  %79 = or i32 %47, 5
  %80 = add nsw i32 %79, %18
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds double, double addrspace(1)* %0, i64 %81
  %83 = load double, double addrspace(1)* %82, align 8, !tbaa !7, !amdgpu.noclobber !6
  %84 = fadd contract double %78, %83
  %85 = or i32 %47, 6
  %86 = add nsw i32 %85, %18
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds double, double addrspace(1)* %0, i64 %87
  %89 = load double, double addrspace(1)* %88, align 8, !tbaa !7, !amdgpu.noclobber !6
  %90 = fadd contract double %84, %89
  %91 = or i32 %47, 7
  %92 = add nsw i32 %91, %18
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds double, double addrspace(1)* %0, i64 %93
  %95 = load double, double addrspace(1)* %94, align 8, !tbaa !7, !amdgpu.noclobber !6
  %96 = fadd contract double %90, %95
  %97 = add nuw nsw i32 %47, 8
  %98 = add i32 %49, 8
  %99 = icmp eq i32 %98, %22
  br i1 %99, label %23, label %46, !llvm.loop !13

100:                                              ; preds = %40, %4
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
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
