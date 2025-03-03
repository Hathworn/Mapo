; ModuleID = '../data/hip_kernels/3208/0/main.cu'
source_filename = "../data/hip_kernels/3208/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z8compressPfiS_i(float addrspace(1)* nocapture readonly %0, i32 %1, float addrspace(1)* nocapture %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 2, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = add i32 %12, %5
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = add i32 %20, %14
  %22 = icmp slt i32 %13, %3
  %23 = icmp slt i32 %21, %3
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %116

25:                                               ; preds = %4
  %26 = mul nsw i32 %13, %3
  %27 = add nsw i32 %21, %26
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %2, i64 %28
  store float 0.000000e+00, float addrspace(1)* %29, align 4, !tbaa !7
  %30 = icmp sgt i32 %3, 0
  br i1 %30, label %31, label %116

31:                                               ; preds = %25
  %32 = and i32 %3, 7
  %33 = icmp ult i32 %3, 8
  %34 = and i32 %3, -8
  %35 = icmp eq i32 %32, 0
  br label %36

36:                                               ; preds = %31, %58
  %37 = phi float [ %59, %58 ], [ 0.000000e+00, %31 ]
  %38 = phi i32 [ %60, %58 ], [ 0, %31 ]
  %39 = add nsw i32 %38, %13
  %40 = mul nsw i32 %39, %1
  %41 = add i32 %40, %21
  br i1 %33, label %42, label %62

42:                                               ; preds = %62, %36
  %43 = phi float [ undef, %36 ], [ %112, %62 ]
  %44 = phi float [ %37, %36 ], [ %112, %62 ]
  %45 = phi i32 [ 0, %36 ], [ %113, %62 ]
  br i1 %35, label %58, label %46

46:                                               ; preds = %42, %46
  %47 = phi float [ %54, %46 ], [ %44, %42 ]
  %48 = phi i32 [ %55, %46 ], [ %45, %42 ]
  %49 = phi i32 [ %56, %46 ], [ 0, %42 ]
  %50 = add i32 %41, %48
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %0, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !7
  %54 = fadd contract float %53, %47
  store float %54, float addrspace(1)* %29, align 4, !tbaa !7
  %55 = add nuw nsw i32 %48, 1
  %56 = add i32 %49, 1
  %57 = icmp eq i32 %56, %32
  br i1 %57, label %58, label %46, !llvm.loop !11

58:                                               ; preds = %46, %42
  %59 = phi float [ %43, %42 ], [ %54, %46 ]
  %60 = add nuw nsw i32 %38, 1
  %61 = icmp eq i32 %60, %3
  br i1 %61, label %116, label %36, !llvm.loop !13

62:                                               ; preds = %36, %62
  %63 = phi float [ %112, %62 ], [ %37, %36 ]
  %64 = phi i32 [ %113, %62 ], [ 0, %36 ]
  %65 = phi i32 [ %114, %62 ], [ 0, %36 ]
  %66 = add i32 %41, %64
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %0, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !7
  %70 = fadd contract float %69, %63
  store float %70, float addrspace(1)* %29, align 4, !tbaa !7
  %71 = or i32 %64, 1
  %72 = add i32 %41, %71
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %0, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !7
  %76 = fadd contract float %75, %70
  store float %76, float addrspace(1)* %29, align 4, !tbaa !7
  %77 = or i32 %64, 2
  %78 = add i32 %41, %77
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %0, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !7
  %82 = fadd contract float %81, %76
  store float %82, float addrspace(1)* %29, align 4, !tbaa !7
  %83 = or i32 %64, 3
  %84 = add i32 %41, %83
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %0, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !7
  %88 = fadd contract float %87, %82
  store float %88, float addrspace(1)* %29, align 4, !tbaa !7
  %89 = or i32 %64, 4
  %90 = add i32 %41, %89
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %0, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !7
  %94 = fadd contract float %93, %88
  store float %94, float addrspace(1)* %29, align 4, !tbaa !7
  %95 = or i32 %64, 5
  %96 = add i32 %41, %95
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %0, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !7
  %100 = fadd contract float %99, %94
  store float %100, float addrspace(1)* %29, align 4, !tbaa !7
  %101 = or i32 %64, 6
  %102 = add i32 %41, %101
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %0, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !7
  %106 = fadd contract float %105, %100
  store float %106, float addrspace(1)* %29, align 4, !tbaa !7
  %107 = or i32 %64, 7
  %108 = add i32 %41, %107
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %0, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !7
  %112 = fadd contract float %111, %106
  store float %112, float addrspace(1)* %29, align 4, !tbaa !7
  %113 = add nuw nsw i32 %64, 8
  %114 = add i32 %65, 8
  %115 = icmp eq i32 %114, %34
  br i1 %115, label %42, label %62, !llvm.loop !15

116:                                              ; preds = %58, %25, %4
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
!15 = distinct !{!15, !14}
