; ModuleID = '../data/hip_kernels/18468/25/main.cu'
source_filename = "../data/hip_kernels/18468/25/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11column_sumsPKfPfm(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i64 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %9
  %12 = add i32 %11, %4
  %13 = sext i32 %12 to i64
  %14 = icmp ult i64 %13, %2
  br i1 %14, label %15, label %70

15:                                               ; preds = %3
  %16 = and i64 %2, 3
  %17 = icmp ult i64 %2, 4
  br i1 %17, label %20, label %18

18:                                               ; preds = %15
  %19 = and i64 %2, -4
  br label %40

20:                                               ; preds = %40, %15
  %21 = phi float [ undef, %15 ], [ %66, %40 ]
  %22 = phi i64 [ 0, %15 ], [ %67, %40 ]
  %23 = phi float [ 0.000000e+00, %15 ], [ %66, %40 ]
  %24 = icmp eq i64 %16, 0
  br i1 %24, label %37, label %25

25:                                               ; preds = %20, %25
  %26 = phi i64 [ %34, %25 ], [ %22, %20 ]
  %27 = phi float [ %33, %25 ], [ %23, %20 ]
  %28 = phi i64 [ %35, %25 ], [ 0, %20 ]
  %29 = mul i64 %26, %2
  %30 = add i64 %29, %13
  %31 = getelementptr inbounds float, float addrspace(1)* %0, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !7, !amdgpu.noclobber !6
  %33 = fadd contract float %27, %32
  %34 = add nuw i64 %26, 1
  %35 = add i64 %28, 1
  %36 = icmp eq i64 %35, %16
  br i1 %36, label %37, label %25, !llvm.loop !11

37:                                               ; preds = %25, %20
  %38 = phi float [ %21, %20 ], [ %33, %25 ]
  %39 = getelementptr inbounds float, float addrspace(1)* %1, i64 %13
  store float %38, float addrspace(1)* %39, align 4, !tbaa !7
  br label %70

40:                                               ; preds = %40, %18
  %41 = phi i64 [ 0, %18 ], [ %67, %40 ]
  %42 = phi float [ 0.000000e+00, %18 ], [ %66, %40 ]
  %43 = phi i64 [ 0, %18 ], [ %68, %40 ]
  %44 = mul i64 %41, %2
  %45 = add i64 %44, %13
  %46 = getelementptr inbounds float, float addrspace(1)* %0, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !7, !amdgpu.noclobber !6
  %48 = fadd contract float %42, %47
  %49 = or i64 %41, 1
  %50 = mul i64 %49, %2
  %51 = add i64 %50, %13
  %52 = getelementptr inbounds float, float addrspace(1)* %0, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !7, !amdgpu.noclobber !6
  %54 = fadd contract float %48, %53
  %55 = or i64 %41, 2
  %56 = mul i64 %55, %2
  %57 = add i64 %56, %13
  %58 = getelementptr inbounds float, float addrspace(1)* %0, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7, !amdgpu.noclobber !6
  %60 = fadd contract float %54, %59
  %61 = or i64 %41, 3
  %62 = mul i64 %61, %2
  %63 = add i64 %62, %13
  %64 = getelementptr inbounds float, float addrspace(1)* %0, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7, !amdgpu.noclobber !6
  %66 = fadd contract float %60, %65
  %67 = add nuw i64 %41, 4
  %68 = add i64 %43, 4
  %69 = icmp eq i64 %68, %19
  br i1 %69, label %20, label %40, !llvm.loop !13

70:                                               ; preds = %37, %3
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
