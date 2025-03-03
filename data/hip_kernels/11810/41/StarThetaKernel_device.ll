; ModuleID = '../data/hip_kernels/11810/41/main.cu'
source_filename = "../data/hip_kernels/11810/41/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z15StarThetaKernelPdS_iiS_d(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, double addrspace(1)* nocapture writeonly %4, double %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = mul i32 %9, %13
  %15 = add i32 %14, %7
  %16 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !5, !invariant.load !6
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = add i32 %22, %16
  %24 = icmp slt i32 %23, %2
  %25 = icmp slt i32 %15, %3
  %26 = select i1 %24, i1 %25, i1 false
  br i1 %26, label %27, label %64

27:                                               ; preds = %6
  %28 = mul nsw i32 %23, %3
  %29 = add nsw i32 %28, %15
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds double, double addrspace(1)* %0, i64 %30
  %32 = load double, double addrspace(1)* %31, align 8, !tbaa !7, !amdgpu.noclobber !6
  %33 = add nsw i32 %3, -1
  %34 = add i32 %33, %15
  %35 = srem i32 %34, %3
  %36 = add nsw i32 %35, %28
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds double, double addrspace(1)* %0, i64 %37
  %39 = load double, double addrspace(1)* %38, align 8, !tbaa !7, !amdgpu.noclobber !6
  %40 = fsub contract double %32, %39
  %41 = add nsw i32 %15, 1
  %42 = srem i32 %41, %3
  %43 = add nsw i32 %42, %28
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds double, double addrspace(1)* %0, i64 %44
  %46 = load double, double addrspace(1)* %45, align 8, !tbaa !7, !amdgpu.noclobber !6
  %47 = fsub contract double %46, %32
  %48 = fmul contract double %40, %47
  %49 = fcmp contract ogt double %48, 0.000000e+00
  br i1 %49, label %50, label %61

50:                                               ; preds = %27
  %51 = sitofp i32 %3 to double
  %52 = fdiv contract double 0x401921FB54442D18, %51
  %53 = sext i32 %23 to i64
  %54 = getelementptr inbounds double, double addrspace(1)* %1, i64 %53
  %55 = load double, double addrspace(1)* %54, align 8, !tbaa !7, !amdgpu.noclobber !6
  %56 = fmul contract double %52, %55
  %57 = fdiv contract double 1.000000e+00, %56
  %58 = fadd contract double %40, %47
  %59 = fdiv contract double %48, %58
  %60 = fmul contract double %59, %57
  br label %61

61:                                               ; preds = %27, %50
  %62 = phi double [ %60, %50 ], [ 0.000000e+00, %27 ]
  %63 = getelementptr inbounds double, double addrspace(1)* %4, i64 %30
  store double %62, double addrspace(1)* %63, align 8, !tbaa !7
  br label %64

64:                                               ; preds = %61, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
