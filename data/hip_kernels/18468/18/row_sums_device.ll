; ModuleID = '../data/hip_kernels/18468/18/main.cu'
source_filename = "../data/hip_kernels/18468/18/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z8row_sumsPKfPfm(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i64 %2) local_unnamed_addr #0 {
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
  br i1 %14, label %15, label %86

15:                                               ; preds = %3
  %16 = mul i64 %13, %2
  %17 = and i64 %2, 7
  %18 = icmp ult i64 %2, 8
  br i1 %18, label %21, label %19

19:                                               ; preds = %15
  %20 = and i64 %2, -8
  br label %40

21:                                               ; preds = %40, %15
  %22 = phi float [ undef, %15 ], [ %82, %40 ]
  %23 = phi i64 [ 0, %15 ], [ %83, %40 ]
  %24 = phi float [ 0.000000e+00, %15 ], [ %82, %40 ]
  %25 = icmp eq i64 %17, 0
  br i1 %25, label %37, label %26

26:                                               ; preds = %21, %26
  %27 = phi i64 [ %34, %26 ], [ %23, %21 ]
  %28 = phi float [ %33, %26 ], [ %24, %21 ]
  %29 = phi i64 [ %35, %26 ], [ 0, %21 ]
  %30 = add i64 %27, %16
  %31 = getelementptr inbounds float, float addrspace(1)* %0, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !7, !amdgpu.noclobber !6
  %33 = fadd contract float %28, %32
  %34 = add nuw i64 %27, 1
  %35 = add i64 %29, 1
  %36 = icmp eq i64 %35, %17
  br i1 %36, label %37, label %26, !llvm.loop !11

37:                                               ; preds = %26, %21
  %38 = phi float [ %22, %21 ], [ %33, %26 ]
  %39 = getelementptr inbounds float, float addrspace(1)* %1, i64 %13
  store float %38, float addrspace(1)* %39, align 4, !tbaa !7
  br label %86

40:                                               ; preds = %40, %19
  %41 = phi i64 [ 0, %19 ], [ %83, %40 ]
  %42 = phi float [ 0.000000e+00, %19 ], [ %82, %40 ]
  %43 = phi i64 [ 0, %19 ], [ %84, %40 ]
  %44 = add i64 %41, %16
  %45 = getelementptr inbounds float, float addrspace(1)* %0, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !6
  %47 = fadd contract float %42, %46
  %48 = or i64 %41, 1
  %49 = add i64 %48, %16
  %50 = getelementptr inbounds float, float addrspace(1)* %0, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !7, !amdgpu.noclobber !6
  %52 = fadd contract float %47, %51
  %53 = or i64 %41, 2
  %54 = add i64 %53, %16
  %55 = getelementptr inbounds float, float addrspace(1)* %0, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !7, !amdgpu.noclobber !6
  %57 = fadd contract float %52, %56
  %58 = or i64 %41, 3
  %59 = add i64 %58, %16
  %60 = getelementptr inbounds float, float addrspace(1)* %0, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !7, !amdgpu.noclobber !6
  %62 = fadd contract float %57, %61
  %63 = or i64 %41, 4
  %64 = add i64 %63, %16
  %65 = getelementptr inbounds float, float addrspace(1)* %0, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !7, !amdgpu.noclobber !6
  %67 = fadd contract float %62, %66
  %68 = or i64 %41, 5
  %69 = add i64 %68, %16
  %70 = getelementptr inbounds float, float addrspace(1)* %0, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !7, !amdgpu.noclobber !6
  %72 = fadd contract float %67, %71
  %73 = or i64 %41, 6
  %74 = add i64 %73, %16
  %75 = getelementptr inbounds float, float addrspace(1)* %0, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !7, !amdgpu.noclobber !6
  %77 = fadd contract float %72, %76
  %78 = or i64 %41, 7
  %79 = add i64 %78, %16
  %80 = getelementptr inbounds float, float addrspace(1)* %0, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !7, !amdgpu.noclobber !6
  %82 = fadd contract float %77, %81
  %83 = add nuw i64 %41, 8
  %84 = add i64 %43, 8
  %85 = icmp eq i64 %84, %20
  br i1 %85, label %21, label %40, !llvm.loop !13

86:                                               ; preds = %37, %3
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
