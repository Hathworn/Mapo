; ModuleID = '../data/hip_kernels/157/1/main.cu'
source_filename = "../data/hip_kernels/157/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z18convertToGrayScalePhS_ii(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 2, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = mul i32 %6, %13
  %15 = add i32 %14, %8
  %16 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = mul i32 %5, %19
  %21 = add i32 %20, %7
  %22 = mul nsw i32 %15, %2
  %23 = add nsw i32 %22, %21
  %24 = icmp slt i32 %15, %3
  %25 = icmp slt i32 %21, %2
  %26 = select i1 %24, i1 %25, i1 false
  br i1 %26, label %27, label %51

27:                                               ; preds = %4
  %28 = mul nsw i32 %23, 3
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %29
  %31 = load i8, i8 addrspace(1)* %30, align 1, !tbaa !7, !amdgpu.noclobber !6
  %32 = uitofp i8 %31 to double
  %33 = fmul contract double %32, 2.100000e-01
  %34 = add nsw i32 %28, 1
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %35
  %37 = load i8, i8 addrspace(1)* %36, align 1, !tbaa !7, !amdgpu.noclobber !6
  %38 = uitofp i8 %37 to double
  %39 = fmul contract double %38, 7.100000e-01
  %40 = fadd contract double %33, %39
  %41 = add nsw i32 %28, 2
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %42
  %44 = load i8, i8 addrspace(1)* %43, align 1, !tbaa !7, !amdgpu.noclobber !6
  %45 = uitofp i8 %44 to double
  %46 = fmul contract double %45, 7.000000e-02
  %47 = fadd contract double %40, %46
  %48 = fptoui double %47 to i8
  %49 = sext i32 %23 to i64
  %50 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %49
  store i8 %48, i8 addrspace(1)* %50, align 1, !tbaa !7
  br label %51

51:                                               ; preds = %27, %4
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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
