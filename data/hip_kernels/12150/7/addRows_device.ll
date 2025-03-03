; ModuleID = '../data/hip_kernels/12150/7/main.cu'
source_filename = "../data/hip_kernels/12150/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ7addRowsPdPiE10multiplier = internal unnamed_addr addrspace(3) global double undef, align 8

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z7addRowsPdPi(double addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture readonly %1) local_unnamed_addr #0 {
  %3 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !4, !amdgpu.noclobber !8
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !9, !invariant.load !8
  %8 = zext i16 %7 to i32
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = add i32 %3, %8
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !10
  %12 = icmp eq i32 %11, 0
  %13 = add i32 %9, 1
  %14 = add i32 %13, %3
  %15 = mul i32 %10, %14
  br i1 %12, label %18, label %16

16:                                               ; preds = %2
  %17 = mul nsw i32 %10, %3
  br label %29

18:                                               ; preds = %2
  %19 = add i32 %15, %3
  %20 = zext i32 %19 to i64
  %21 = getelementptr inbounds double, double addrspace(1)* %0, i64 %20
  %22 = load double, double addrspace(1)* %21, align 8, !tbaa !11, !amdgpu.noclobber !8
  %23 = mul nsw i32 %10, %3
  %24 = add nsw i32 %23, %3
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds double, double addrspace(1)* %0, i64 %25
  %27 = load double, double addrspace(1)* %26, align 8, !tbaa !11, !amdgpu.noclobber !8
  %28 = fdiv contract double %22, %27
  store double %28, double addrspace(3)* @_ZZ7addRowsPdPiE10multiplier, align 8, !tbaa !11
  br label %29

29:                                               ; preds = %16, %18
  %30 = phi i32 [ %17, %16 ], [ %23, %18 ]
  %31 = add i32 %3, %11
  %32 = add i32 %31, %15
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %33 = add i32 %31, %30
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds double, double addrspace(1)* %0, i64 %34
  %36 = load double, double addrspace(1)* %35, align 8, !tbaa !11, !amdgpu.noclobber !8
  %37 = load double, double addrspace(3)* @_ZZ7addRowsPdPiE10multiplier, align 8, !tbaa !11
  %38 = fmul contract double %36, %37
  %39 = sext i32 %32 to i64
  %40 = getelementptr inbounds double, double addrspace(1)* %0, i64 %39
  %41 = load double, double addrspace(1)* %40, align 8, !tbaa !11, !amdgpu.noclobber !8
  %42 = fsub contract double %41, %38
  store double %42, double addrspace(1)* %40, align 8, !tbaa !11
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
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i16 1, i16 1025}
!10 = !{i32 0, i32 1024}
!11 = !{!12, !12, i64 0}
!12 = !{!"double", !6, i64 0}
