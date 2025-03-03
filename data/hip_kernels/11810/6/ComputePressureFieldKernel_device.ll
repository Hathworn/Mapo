; ModuleID = '../data/hip_kernels/11810/6/main.cu'
source_filename = "../data/hip_kernels/11810/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z26ComputePressureFieldKernelPdS_S_iiidS_(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5, double %6, double addrspace(1)* nocapture readonly %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !5, !invariant.load !6
  %15 = zext i16 %14 to i32
  %16 = mul i32 %11, %15
  %17 = add i32 %16, %9
  %18 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 2, !range !5, !invariant.load !6
  %23 = zext i16 %22 to i32
  %24 = mul i32 %19, %23
  %25 = add i32 %24, %18
  %26 = icmp slt i32 %25, %4
  %27 = icmp slt i32 %17, %5
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %53

29:                                               ; preds = %8
  %30 = icmp eq i32 %3, 0
  br i1 %30, label %31, label %41

31:                                               ; preds = %29
  %32 = mul nsw i32 %25, %5
  %33 = add nsw i32 %32, %17
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds double, double addrspace(1)* %1, i64 %34
  %36 = load double, double addrspace(1)* %35, align 8, !tbaa !7, !amdgpu.noclobber !6
  %37 = getelementptr inbounds double, double addrspace(1)* %0, i64 %34
  %38 = load double, double addrspace(1)* %37, align 8, !tbaa !7, !amdgpu.noclobber !6
  %39 = fmul contract double %36, %38
  %40 = fmul contract double %38, %39
  br label %49

41:                                               ; preds = %29
  %42 = fadd contract double %6, -1.000000e+00
  %43 = mul nsw i32 %25, %5
  %44 = add nsw i32 %43, %17
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds double, double addrspace(1)* %7, i64 %45
  %47 = load double, double addrspace(1)* %46, align 8, !tbaa !7, !amdgpu.noclobber !6
  %48 = fmul contract double %42, %47
  br label %49

49:                                               ; preds = %41, %31
  %50 = phi i64 [ %34, %31 ], [ %45, %41 ]
  %51 = phi double [ %40, %31 ], [ %48, %41 ]
  %52 = getelementptr inbounds double, double addrspace(1)* %2, i64 %50
  store double %51, double addrspace(1)* %52, align 8, !tbaa !7
  br label %53

53:                                               ; preds = %49, %8
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
