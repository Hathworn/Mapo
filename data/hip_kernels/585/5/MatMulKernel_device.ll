; ModuleID = '../data/hip_kernels/585/5/main.cu'
source_filename = "../data/hip_kernels/585/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12MatMulKernelPfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 2, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %21 = add i32 %19, %20
  %22 = icmp sgt i32 %3, 0
  %23 = mul nsw i32 %13, %3
  %24 = sext i32 %23 to i64
  br i1 %22, label %27, label %25

25:                                               ; preds = %4
  %26 = sext i32 %21 to i64
  br label %56

27:                                               ; preds = %4
  %28 = getelementptr inbounds float, float addrspace(1)* %0, i64 %24
  %29 = sext i32 %21 to i64
  %30 = getelementptr float, float addrspace(1)* %1, i64 %29
  %31 = and i32 %3, 7
  %32 = icmp ult i32 %3, 8
  br i1 %32, label %35, label %33

33:                                               ; preds = %27
  %34 = and i32 %3, -8
  br label %61

35:                                               ; preds = %61, %27
  %36 = phi float [ undef, %27 ], [ %143, %61 ]
  %37 = phi float [ 0.000000e+00, %27 ], [ %143, %61 ]
  %38 = phi i32 [ 0, %27 ], [ %144, %61 ]
  %39 = icmp eq i32 %31, 0
  br i1 %39, label %56, label %40

40:                                               ; preds = %35, %40
  %41 = phi float [ %52, %40 ], [ %37, %35 ]
  %42 = phi i32 [ %53, %40 ], [ %38, %35 ]
  %43 = phi i32 [ %54, %40 ], [ 0, %35 ]
  %44 = zext i32 %42 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %28, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !5
  %47 = mul nsw i32 %42, %3
  %48 = sext i32 %47 to i64
  %49 = getelementptr float, float addrspace(1)* %30, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !7, !amdgpu.noclobber !5
  %51 = fmul contract float %46, %50
  %52 = fadd contract float %41, %51
  %53 = add nuw nsw i32 %42, 1
  %54 = add i32 %43, 1
  %55 = icmp eq i32 %54, %31
  br i1 %55, label %56, label %40, !llvm.loop !11

56:                                               ; preds = %35, %40, %25
  %57 = phi i64 [ %26, %25 ], [ %29, %40 ], [ %29, %35 ]
  %58 = phi float [ 0.000000e+00, %25 ], [ %36, %35 ], [ %52, %40 ]
  %59 = getelementptr inbounds float, float addrspace(1)* %2, i64 %24
  %60 = getelementptr inbounds float, float addrspace(1)* %59, i64 %57
  store float %58, float addrspace(1)* %60, align 4, !tbaa !7
  ret void

61:                                               ; preds = %61, %33
  %62 = phi float [ 0.000000e+00, %33 ], [ %143, %61 ]
  %63 = phi i32 [ 0, %33 ], [ %144, %61 ]
  %64 = phi i32 [ 0, %33 ], [ %145, %61 ]
  %65 = zext i32 %63 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %28, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !7, !amdgpu.noclobber !5
  %68 = mul nsw i32 %63, %3
  %69 = sext i32 %68 to i64
  %70 = getelementptr float, float addrspace(1)* %30, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !7, !amdgpu.noclobber !5
  %72 = fmul contract float %67, %71
  %73 = fadd contract float %62, %72
  %74 = or i32 %63, 1
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %28, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !7, !amdgpu.noclobber !5
  %78 = mul nsw i32 %74, %3
  %79 = sext i32 %78 to i64
  %80 = getelementptr float, float addrspace(1)* %30, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !7, !amdgpu.noclobber !5
  %82 = fmul contract float %77, %81
  %83 = fadd contract float %73, %82
  %84 = or i32 %63, 2
  %85 = zext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %28, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !7, !amdgpu.noclobber !5
  %88 = mul nsw i32 %84, %3
  %89 = sext i32 %88 to i64
  %90 = getelementptr float, float addrspace(1)* %30, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !7, !amdgpu.noclobber !5
  %92 = fmul contract float %87, %91
  %93 = fadd contract float %83, %92
  %94 = or i32 %63, 3
  %95 = zext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %28, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !7, !amdgpu.noclobber !5
  %98 = mul nsw i32 %94, %3
  %99 = sext i32 %98 to i64
  %100 = getelementptr float, float addrspace(1)* %30, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !7, !amdgpu.noclobber !5
  %102 = fmul contract float %97, %101
  %103 = fadd contract float %93, %102
  %104 = or i32 %63, 4
  %105 = zext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %28, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !7, !amdgpu.noclobber !5
  %108 = mul nsw i32 %104, %3
  %109 = sext i32 %108 to i64
  %110 = getelementptr float, float addrspace(1)* %30, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !7, !amdgpu.noclobber !5
  %112 = fmul contract float %107, %111
  %113 = fadd contract float %103, %112
  %114 = or i32 %63, 5
  %115 = zext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %28, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !7, !amdgpu.noclobber !5
  %118 = mul nsw i32 %114, %3
  %119 = sext i32 %118 to i64
  %120 = getelementptr float, float addrspace(1)* %30, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !7, !amdgpu.noclobber !5
  %122 = fmul contract float %117, %121
  %123 = fadd contract float %113, %122
  %124 = or i32 %63, 6
  %125 = zext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %28, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !7, !amdgpu.noclobber !5
  %128 = mul nsw i32 %124, %3
  %129 = sext i32 %128 to i64
  %130 = getelementptr float, float addrspace(1)* %30, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !7, !amdgpu.noclobber !5
  %132 = fmul contract float %127, %131
  %133 = fadd contract float %123, %132
  %134 = or i32 %63, 7
  %135 = zext i32 %134 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %28, i64 %135
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !7, !amdgpu.noclobber !5
  %138 = mul nsw i32 %134, %3
  %139 = sext i32 %138 to i64
  %140 = getelementptr float, float addrspace(1)* %30, i64 %139
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !7, !amdgpu.noclobber !5
  %142 = fmul contract float %137, %141
  %143 = fadd contract float %133, %142
  %144 = add nuw nsw i32 %63, 8
  %145 = add i32 %64, 8
  %146 = icmp eq i32 %145, %34
  br i1 %146, label %35, label %61, !llvm.loop !13
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
