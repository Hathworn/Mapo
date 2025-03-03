; ModuleID = '../data/hip_kernels/11684/26/main.cu'
source_filename = "../data/hip_kernels/11684/26/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sdata = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @reducePartial(i32 %0, i8 addrspace(1)* nocapture readonly %1, i8 addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = bitcast i8 addrspace(1)* %1 to float addrspace(1)*
  %5 = bitcast i8 addrspace(1)* %2 to float addrspace(1)*
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = shl i32 %7, 1
  %14 = mul i32 %13, %12
  %15 = add i32 %14, %6
  %16 = icmp ult i32 %15, %0
  br i1 %16, label %17, label %21

17:                                               ; preds = %3
  %18 = zext i32 %15 to i64
  %19 = getelementptr inbounds float, float addrspace(1)* %4, i64 %18
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %21

21:                                               ; preds = %3, %17
  %22 = phi contract float [ %20, %17 ], [ 0.000000e+00, %3 ]
  %23 = add i32 %15, %12
  %24 = icmp ult i32 %23, %0
  br i1 %24, label %25, label %29

25:                                               ; preds = %21
  %26 = zext i32 %23 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %4, i64 %26
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %29

29:                                               ; preds = %21, %25
  %30 = phi contract float [ %28, %25 ], [ 0.000000e+00, %21 ]
  %31 = fadd contract float %22, %30
  %32 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %6
  store float %31, float addrspace(3)* %32, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %33 = icmp ult i16 %11, 2
  br i1 %33, label %34, label %36

34:                                               ; preds = %46, %29
  %35 = icmp eq i32 %6, 0
  br i1 %35, label %48, label %52

36:                                               ; preds = %29, %46
  %37 = phi i32 [ %38, %46 ], [ %12, %29 ]
  %38 = lshr i32 %37, 1
  %39 = icmp ult i32 %6, %38
  br i1 %39, label %40, label %46

40:                                               ; preds = %36
  %41 = add nuw nsw i32 %38, %6
  %42 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %41
  %43 = load float, float addrspace(3)* %42, align 4, !tbaa !7
  %44 = load float, float addrspace(3)* %32, align 4, !tbaa !7
  %45 = fadd contract float %43, %44
  store float %45, float addrspace(3)* %32, align 4, !tbaa !7
  br label %46

46:                                               ; preds = %40, %36
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %47 = icmp ult i32 %37, 4
  br i1 %47, label %34, label %36, !llvm.loop !11

48:                                               ; preds = %34
  %49 = load float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 0), align 4, !tbaa !7
  %50 = zext i32 %7 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %5, i64 %50
  store float %49, float addrspace(1)* %51, align 4, !tbaa !7
  br label %52

52:                                               ; preds = %48, %34
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

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
