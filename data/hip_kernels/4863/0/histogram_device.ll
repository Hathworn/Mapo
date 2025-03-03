; ModuleID = '../data/hip_kernels/4863/0/main.cu'
source_filename = "../data/hip_kernels/4863/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sharedpartitions = external hidden addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9histogramPiPxxi(i32 addrspace(1)* nocapture %0, i64 addrspace(1)* nocapture readonly %1, i64 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = mul i32 %11, %10
  %13 = add nsw i32 %12, %5
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sharedpartitions, i32 0, i32 %3
  %16 = icmp slt i32 %5, %3
  br i1 %16, label %21, label %17

17:                                               ; preds = %21, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %18 = sitofp i32 %3 to float
  %19 = tail call i1 @llvm.amdgcn.class.f32(float %18, i32 144)
  %20 = icmp slt i64 %14, %2
  br i1 %20, label %26, label %40

21:                                               ; preds = %4, %21
  %22 = phi i32 [ %24, %21 ], [ %5, %4 ]
  %23 = getelementptr inbounds i32, i32 addrspace(3)* %15, i32 %22
  store i32 0, i32 addrspace(3)* %23, align 4, !tbaa !7
  %24 = add nuw nsw i32 %22, %10
  %25 = icmp slt i32 %24, %3
  br i1 %25, label %21, label %17, !llvm.loop !11

26:                                               ; preds = %17
  %27 = select i1 %19, float 0x41F0000000000000, float 1.000000e+00
  %28 = fmul float %27, %18
  %29 = tail call float @llvm.log2.f32(float %28)
  %30 = select i1 %19, float 3.200000e+01, float 0.000000e+00
  %31 = fsub float %29, %30
  %32 = tail call float @llvm.ceil.f32(float %31)
  %33 = fptoui float %32 to i32
  %34 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %14
  %35 = load i64, i64 addrspace(1)* %34, align 8, !tbaa !13, !amdgpu.noclobber !6
  %36 = trunc i64 %35 to i32
  %37 = tail call i32 asm "bfe.u32 $0, $1, $2, $3;", "=r,r,r,r"(i32 %36, i32 0, i32 %33) #4, !srcloc !15
  %38 = getelementptr inbounds i32, i32 addrspace(3)* %15, i32 %37
  %39 = atomicrmw add i32 addrspace(3)* %38, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %40

40:                                               ; preds = %26, %17
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %16, label %42, label %41

41:                                               ; preds = %42, %40
  ret void

42:                                               ; preds = %40, %42
  %43 = phi i32 [ %49, %42 ], [ %5, %40 ]
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %44
  %46 = getelementptr inbounds i32, i32 addrspace(3)* %15, i32 %43
  %47 = load i32, i32 addrspace(3)* %46, align 4, !tbaa !7
  %48 = atomicrmw add i32 addrspace(1)* %45, i32 %47 syncscope("agent-one-as") monotonic, align 4
  %49 = add nuw nsw i32 %43, %10
  %50 = icmp slt i32 %49, %3
  br i1 %50, label %42, label %41, !llvm.loop !16
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.ceil.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { convergent nounwind readnone }

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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!14, !14, i64 0}
!14 = !{!"long long", !9, i64 0}
!15 = !{i64 7744926}
!16 = distinct !{!16, !12}
