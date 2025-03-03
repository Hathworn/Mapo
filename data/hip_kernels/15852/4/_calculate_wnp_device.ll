; ModuleID = '../data/hip_kernels/15852/4/main.cu'
source_filename = "../data/hip_kernels/15852/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14_calculate_wnpPKlS0_PfPliiii(i64 addrspace(1)* nocapture readonly %0, i64 addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i64 addrspace(1)* nocapture writeonly %3, i32 %4, i32 %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !5, !invariant.load !6
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = add i32 %16, %9
  %18 = mul i32 %6, %5
  %19 = mul i32 %18, %4
  %20 = icmp slt i32 %17, %19
  br i1 %20, label %21, label %106

21:                                               ; preds = %8
  %22 = sdiv i32 %17, %18
  %23 = mul nsw i32 %22, %5
  %24 = mul nsw i32 %23, %6
  %25 = sub nsw i32 %17, %24
  %26 = sdiv i32 %25, %6
  %27 = srem i32 %17, %6
  %28 = sext i32 %17 to i64
  %29 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %28
  %30 = load i64, i64 addrspace(1)* %29, align 8, !tbaa !7, !amdgpu.noclobber !6
  %31 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %28
  %32 = load i64, i64 addrspace(1)* %31, align 8, !tbaa !7, !amdgpu.noclobber !6
  %33 = trunc i64 %32 to i32
  %34 = add i32 %23, %26
  %35 = mul i32 %34, %7
  %36 = add i32 %35, %33
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %2, i64 %37
  %39 = shl i32 %36, 1
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i64, i64 addrspace(1)* %3, i64 %40
  %42 = icmp sgt i64 %30, 0
  br i1 %42, label %43, label %106

43:                                               ; preds = %21
  %44 = sitofp i64 %30 to float
  %45 = sext i32 %27 to i64
  %46 = add nsw i32 %27, 1
  %47 = srem i32 %46, %6
  %48 = sext i32 %47 to i64
  %49 = and i64 %30, 3
  %50 = icmp ult i64 %30, 4
  br i1 %50, label %90, label %51

51:                                               ; preds = %43
  %52 = and i64 %30, -4
  br label %53

53:                                               ; preds = %53, %51
  %54 = phi i64 [ 0, %51 ], [ %87, %53 ]
  %55 = phi i64 [ 0, %51 ], [ %88, %53 ]
  %56 = sitofp i64 %54 to float
  %57 = fdiv contract float %56, %44
  %58 = getelementptr inbounds float, float addrspace(1)* %38, i64 %54
  store float %57, float addrspace(1)* %58, align 4, !tbaa !11
  %59 = shl nuw nsw i64 %54, 1
  %60 = getelementptr inbounds i64, i64 addrspace(1)* %41, i64 %59
  store i64 %45, i64 addrspace(1)* %60, align 8, !tbaa !7
  %61 = add nuw nsw i64 %59, 1
  %62 = getelementptr inbounds i64, i64 addrspace(1)* %41, i64 %61
  store i64 %48, i64 addrspace(1)* %62, align 8, !tbaa !7
  %63 = or i64 %54, 1
  %64 = sitofp i64 %63 to float
  %65 = fdiv contract float %64, %44
  %66 = getelementptr inbounds float, float addrspace(1)* %38, i64 %63
  store float %65, float addrspace(1)* %66, align 4, !tbaa !11
  %67 = shl nuw nsw i64 %63, 1
  %68 = getelementptr inbounds i64, i64 addrspace(1)* %41, i64 %67
  store i64 %45, i64 addrspace(1)* %68, align 8, !tbaa !7
  %69 = add nuw nsw i64 %67, 1
  %70 = getelementptr inbounds i64, i64 addrspace(1)* %41, i64 %69
  store i64 %48, i64 addrspace(1)* %70, align 8, !tbaa !7
  %71 = or i64 %54, 2
  %72 = sitofp i64 %71 to float
  %73 = fdiv contract float %72, %44
  %74 = getelementptr inbounds float, float addrspace(1)* %38, i64 %71
  store float %73, float addrspace(1)* %74, align 4, !tbaa !11
  %75 = shl nuw nsw i64 %71, 1
  %76 = getelementptr inbounds i64, i64 addrspace(1)* %41, i64 %75
  store i64 %45, i64 addrspace(1)* %76, align 8, !tbaa !7
  %77 = add nuw nsw i64 %75, 1
  %78 = getelementptr inbounds i64, i64 addrspace(1)* %41, i64 %77
  store i64 %48, i64 addrspace(1)* %78, align 8, !tbaa !7
  %79 = or i64 %54, 3
  %80 = sitofp i64 %79 to float
  %81 = fdiv contract float %80, %44
  %82 = getelementptr inbounds float, float addrspace(1)* %38, i64 %79
  store float %81, float addrspace(1)* %82, align 4, !tbaa !11
  %83 = shl nuw nsw i64 %79, 1
  %84 = getelementptr inbounds i64, i64 addrspace(1)* %41, i64 %83
  store i64 %45, i64 addrspace(1)* %84, align 8, !tbaa !7
  %85 = add nuw nsw i64 %83, 1
  %86 = getelementptr inbounds i64, i64 addrspace(1)* %41, i64 %85
  store i64 %48, i64 addrspace(1)* %86, align 8, !tbaa !7
  %87 = add nuw nsw i64 %54, 4
  %88 = add nuw i64 %55, 4
  %89 = icmp eq i64 %88, %52
  br i1 %89, label %90, label %53, !llvm.loop !13

90:                                               ; preds = %53, %43
  %91 = phi i64 [ 0, %43 ], [ %87, %53 ]
  %92 = icmp eq i64 %49, 0
  br i1 %92, label %106, label %93

93:                                               ; preds = %90, %93
  %94 = phi i64 [ %103, %93 ], [ %91, %90 ]
  %95 = phi i64 [ %104, %93 ], [ 0, %90 ]
  %96 = sitofp i64 %94 to float
  %97 = fdiv contract float %96, %44
  %98 = getelementptr inbounds float, float addrspace(1)* %38, i64 %94
  store float %97, float addrspace(1)* %98, align 4, !tbaa !11
  %99 = shl nuw nsw i64 %94, 1
  %100 = getelementptr inbounds i64, i64 addrspace(1)* %41, i64 %99
  store i64 %45, i64 addrspace(1)* %100, align 8, !tbaa !7
  %101 = add nuw nsw i64 %99, 1
  %102 = getelementptr inbounds i64, i64 addrspace(1)* %41, i64 %101
  store i64 %48, i64 addrspace(1)* %102, align 8, !tbaa !7
  %103 = add nuw nsw i64 %94, 1
  %104 = add i64 %95, 1
  %105 = icmp eq i64 %104, %49
  br i1 %105, label %106, label %93, !llvm.loop !15

106:                                              ; preds = %90, %93, %21, %8
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
!8 = !{!"long", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
