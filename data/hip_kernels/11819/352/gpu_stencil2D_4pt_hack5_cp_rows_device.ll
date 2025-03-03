; ModuleID = '../data/hip_kernels/11819/352/main.cu'
source_filename = "../data/hip_kernels/11819/352/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z31gpu_stencil2D_4pt_hack5_cp_rowsPdS_S_iii(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readnone %1, double addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = mul i32 %7, %3
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = mul i32 %14, %13
  %16 = mul nsw i32 %8, %5
  %17 = add nsw i32 %15, %16
  %18 = add nsw i32 %8, 1
  %19 = icmp sge i32 %18, %4
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %21 = add i32 %15, %20
  %22 = icmp sge i32 %21, %5
  %23 = sdiv i32 %8, %3
  %24 = shl i32 %5, 1
  %25 = mul i32 %24, %23
  %26 = add i32 %21, %25
  %27 = add nsw i32 %26, %5
  br i1 %22, label %35, label %28

28:                                               ; preds = %6
  %29 = add nsw i32 %17, %20
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds double, double addrspace(1)* %0, i64 %30
  %32 = load double, double addrspace(1)* %31, align 8, !tbaa !7, !amdgpu.noclobber !5
  %33 = sext i32 %26 to i64
  %34 = getelementptr inbounds double, double addrspace(1)* %2, i64 %33
  store double %32, double addrspace(1)* %34, align 8, !tbaa !7
  br label %35

35:                                               ; preds = %28, %6
  %36 = select i1 %19, i1 true, i1 %22
  br i1 %36, label %45, label %37

37:                                               ; preds = %35
  %38 = add i32 %17, %20
  %39 = add i32 %38, %5
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds double, double addrspace(1)* %0, i64 %40
  %42 = load double, double addrspace(1)* %41, align 8, !tbaa !7
  %43 = sext i32 %27 to i64
  %44 = getelementptr inbounds double, double addrspace(1)* %2, i64 %43
  store double %42, double addrspace(1)* %44, align 8, !tbaa !7
  br label %45

45:                                               ; preds = %35, %37
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
