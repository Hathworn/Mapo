; ModuleID = '../data/hip_kernels/200/2/main.cu'
source_filename = "../data/hip_kernels/200/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z6helperPfS_i(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp sge i32 %12, %2
  %14 = icmp ult i32 %12, %9
  %15 = select i1 %13, i1 true, i1 %14
  br i1 %15, label %88, label %16

16:                                               ; preds = %3
  %17 = udiv i32 %12, %9
  %18 = sext i32 %12 to i64
  %19 = getelementptr inbounds float, float addrspace(1)* %0, i64 %18
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !7
  %21 = tail call i32 @llvm.umax.i32(i32 %17, i32 1)
  %22 = add i32 %21, -1
  %23 = and i32 %21, 7
  %24 = icmp ult i32 %22, 7
  br i1 %24, label %73, label %25

25:                                               ; preds = %16
  %26 = and i32 %21, -8
  br label %27

27:                                               ; preds = %27, %25
  %28 = phi float [ %20, %25 ], [ %69, %27 ]
  %29 = phi i32 [ 0, %25 ], [ %70, %27 ]
  %30 = phi i32 [ 0, %25 ], [ %71, %27 ]
  %31 = zext i32 %29 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %1, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !7
  %34 = fadd contract float %33, %28
  store float %34, float addrspace(1)* %19, align 4, !tbaa !7
  %35 = or i32 %29, 1
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %1, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !7
  %39 = fadd contract float %38, %34
  store float %39, float addrspace(1)* %19, align 4, !tbaa !7
  %40 = or i32 %29, 2
  %41 = zext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %1, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7
  %44 = fadd contract float %43, %39
  store float %44, float addrspace(1)* %19, align 4, !tbaa !7
  %45 = or i32 %29, 3
  %46 = zext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %1, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !7
  %49 = fadd contract float %48, %44
  store float %49, float addrspace(1)* %19, align 4, !tbaa !7
  %50 = or i32 %29, 4
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %1, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !7
  %54 = fadd contract float %53, %49
  store float %54, float addrspace(1)* %19, align 4, !tbaa !7
  %55 = or i32 %29, 5
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %1, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !7
  %59 = fadd contract float %58, %54
  store float %59, float addrspace(1)* %19, align 4, !tbaa !7
  %60 = or i32 %29, 6
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %1, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !7
  %64 = fadd contract float %63, %59
  store float %64, float addrspace(1)* %19, align 4, !tbaa !7
  %65 = or i32 %29, 7
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %1, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !7
  %69 = fadd contract float %68, %64
  store float %69, float addrspace(1)* %19, align 4, !tbaa !7
  %70 = add nuw nsw i32 %29, 8
  %71 = add i32 %30, 8
  %72 = icmp eq i32 %71, %26
  br i1 %72, label %73, label %27, !llvm.loop !11

73:                                               ; preds = %27, %16
  %74 = phi float [ %20, %16 ], [ %69, %27 ]
  %75 = phi i32 [ 0, %16 ], [ %70, %27 ]
  %76 = icmp eq i32 %23, 0
  br i1 %76, label %88, label %77

77:                                               ; preds = %73, %77
  %78 = phi float [ %84, %77 ], [ %74, %73 ]
  %79 = phi i32 [ %85, %77 ], [ %75, %73 ]
  %80 = phi i32 [ %86, %77 ], [ 0, %73 ]
  %81 = zext i32 %79 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %1, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !7
  %84 = fadd contract float %83, %78
  store float %84, float addrspace(1)* %19, align 4, !tbaa !7
  %85 = add nuw nsw i32 %79, 1
  %86 = add i32 %80, 1
  %87 = icmp eq i32 %86, %23
  br i1 %87, label %88, label %77, !llvm.loop !13

88:                                               ; preds = %73, %77, %3
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.umax.i32(i32, i32) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
