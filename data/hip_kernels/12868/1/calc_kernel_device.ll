; ModuleID = '../data/hip_kernels/12868/1/main.cu'
source_filename = "../data/hip_kernels/12868/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z11calc_kernelPdS_iid(double addrspace(1)* nocapture writeonly %0, double addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, double %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = mul i32 %6, %12
  %14 = add i32 %13, %7
  %15 = icmp slt i32 %6, %2
  %16 = icmp sgt i32 %6, 0
  %17 = and i1 %16, %15
  %18 = icmp slt i32 %7, %3
  %19 = select i1 %17, i1 %18, i1 false
  br i1 %19, label %20, label %47

20:                                               ; preds = %5
  %21 = add nsw i32 %14, 1
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds double, double addrspace(1)* %1, i64 %22
  %24 = load double, double addrspace(1)* %23, align 8, !tbaa !7, !amdgpu.noclobber !6
  %25 = add nsw i32 %14, -1
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds double, double addrspace(1)* %1, i64 %26
  %28 = load double, double addrspace(1)* %27, align 8, !tbaa !7, !amdgpu.noclobber !6
  %29 = fadd contract double %24, %28
  %30 = add nsw i32 %6, -1
  %31 = mul i32 %30, %12
  %32 = add i32 %31, %7
  %33 = zext i32 %32 to i64
  %34 = getelementptr inbounds double, double addrspace(1)* %1, i64 %33
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !7, !amdgpu.noclobber !6
  %36 = fadd contract double %29, %35
  %37 = add nuw nsw i32 %6, 1
  %38 = mul i32 %37, %12
  %39 = add i32 %38, %7
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds double, double addrspace(1)* %1, i64 %40
  %42 = load double, double addrspace(1)* %41, align 8, !tbaa !7, !amdgpu.noclobber !6
  %43 = fadd contract double %36, %42
  %44 = fmul contract double %43, 2.000000e-01
  %45 = sext i32 %14 to i64
  %46 = getelementptr inbounds double, double addrspace(1)* %0, i64 %45
  store double %44, double addrspace(1)* %46, align 8, !tbaa !7
  br label %47

47:                                               ; preds = %20, %5
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
