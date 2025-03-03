; ModuleID = '../data/hip_kernels/11810/18/main.cu'
source_filename = "../data/hip_kernels/11810/18/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z28NonReflectingBoundaryKernel2PdS_iiS_S_didi(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readnone %1, i32 %2, i32 %3, double addrspace(1)* nocapture %4, double addrspace(1)* nocapture readonly %5, double %6, i32 %7, double %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !5, !invariant.load !6
  %16 = zext i16 %15 to i32
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %18 = mul i32 %17, %16
  %19 = add i32 %18, %11
  %20 = add nsw i32 %19, %3
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds double, double addrspace(1)* %5, i64 %21
  %23 = load double, double addrspace(1)* %22, align 8, !tbaa !7, !amdgpu.noclobber !6
  %24 = fneg contract double %23
  %25 = getelementptr inbounds double, double addrspace(1)* %0, i64 %21
  %26 = load double, double addrspace(1)* %25, align 8, !tbaa !7, !amdgpu.noclobber !6
  %27 = fsub contract double %26, %6
  %28 = fmul contract double %27, %24
  %29 = fdiv contract double %28, %6
  %30 = fmul contract double %29, 2.000000e+00
  %31 = shl nsw i32 %3, 1
  %32 = add nsw i32 %19, %31
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds double, double addrspace(1)* %4, i64 %33
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !7, !amdgpu.noclobber !6
  %36 = fsub contract double %30, %35
  %37 = getelementptr inbounds double, double addrspace(1)* %4, i64 %21
  store double %36, double addrspace(1)* %37, align 8, !tbaa !7
  %38 = add nsw i32 %7, -1
  %39 = mul nsw i32 %38, %3
  %40 = add nsw i32 %19, %39
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds double, double addrspace(1)* %5, i64 %41
  %43 = load double, double addrspace(1)* %42, align 8, !tbaa !7
  %44 = add nsw i32 %7, -2
  %45 = mul nsw i32 %44, %3
  %46 = add nsw i32 %19, %45
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds double, double addrspace(1)* %0, i64 %47
  %49 = load double, double addrspace(1)* %48, align 8, !tbaa !7
  %50 = fsub contract double %49, %8
  %51 = fmul contract double %43, %50
  %52 = fdiv contract double %51, %8
  %53 = fmul contract double %52, 2.000000e+00
  %54 = getelementptr inbounds double, double addrspace(1)* %4, i64 %47
  %55 = load double, double addrspace(1)* %54, align 8, !tbaa !7
  %56 = fsub contract double %53, %55
  %57 = getelementptr inbounds double, double addrspace(1)* %4, i64 %41
  store double %56, double addrspace(1)* %57, align 8, !tbaa !7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

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
