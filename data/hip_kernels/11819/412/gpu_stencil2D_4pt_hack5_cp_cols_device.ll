; ModuleID = '../data/hip_kernels/11819/412/main.cu'
source_filename = "../data/hip_kernels/11819/412/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z31gpu_stencil2D_4pt_hack5_cp_colsPdS_S_iiii(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture readnone %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = mul i32 %8, %4
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %3
  %12 = mul nsw i32 %9, %6
  %13 = add nsw i32 %12, %11
  %14 = add nsw i32 %11, 1
  %15 = icmp sge i32 %14, %6
  %16 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %17 = shl i32 %10, 1
  %18 = mul i32 %17, %5
  %19 = add i32 %9, %16
  %20 = add i32 %19, %18
  %21 = add nsw i32 %20, %5
  %22 = icmp sge i32 %19, %5
  br i1 %22, label %31, label %23

23:                                               ; preds = %7
  %24 = mul nsw i32 %16, %6
  %25 = add nsw i32 %13, %24
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds double, double addrspace(1)* %0, i64 %26
  %28 = load double, double addrspace(1)* %27, align 8, !tbaa !5, !amdgpu.noclobber !9
  %29 = sext i32 %20 to i64
  %30 = getelementptr inbounds double, double addrspace(1)* %1, i64 %29
  store double %28, double addrspace(1)* %30, align 8, !tbaa !5
  br label %31

31:                                               ; preds = %23, %7
  %32 = select i1 %15, i1 true, i1 %22
  br i1 %32, label %42, label %33

33:                                               ; preds = %31
  %34 = mul nsw i32 %16, %6
  %35 = add i32 %34, 1
  %36 = add i32 %35, %13
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds double, double addrspace(1)* %0, i64 %37
  %39 = load double, double addrspace(1)* %38, align 8, !tbaa !5
  %40 = sext i32 %21 to i64
  %41 = getelementptr inbounds double, double addrspace(1)* %1, i64 %40
  store double %39, double addrspace(1)* %41, align 8, !tbaa !5
  br label %42

42:                                               ; preds = %31, %33
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"double", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
