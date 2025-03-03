; ModuleID = '../data/hip_kernels/2758/34/main.cu'
source_filename = "../data/hip_kernels/2758/34/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19convolve_gpu_kernelPfS_S_iiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %18 = add i32 %16, %17
  %19 = freeze i32 %18
  %20 = freeze i32 %3
  %21 = sdiv i32 %19, %20
  %22 = mul i32 %21, %20
  %23 = sub i32 %19, %22
  %24 = freeze i32 %4
  %25 = sdiv i32 %21, %24
  %26 = mul i32 %25, %24
  %27 = sub i32 %21, %26
  %28 = icmp slt i32 %25, %6
  br i1 %28, label %29, label %140

29:                                               ; preds = %9
  %30 = mul i32 %25, %4
  %31 = add i32 %30, %27
  %32 = mul i32 %31, %3
  %33 = add i32 %32, %23
  %34 = icmp sgt i32 %5, 0
  br i1 %34, label %35, label %136

35:                                               ; preds = %29
  %36 = mul nsw i32 %25, %5
  %37 = icmp sgt i32 %7, 0
  %38 = sub i32 %27, %8
  %39 = sub i32 %23, %8
  %40 = and i32 %7, 1
  %41 = icmp eq i32 %7, 1
  %42 = and i32 %7, -2
  %43 = icmp eq i32 %40, 0
  br label %44

44:                                               ; preds = %35, %132
  %45 = phi i32 [ 0, %35 ], [ %134, %132 ]
  %46 = phi float [ 0.000000e+00, %35 ], [ %133, %132 ]
  %47 = add i32 %45, %36
  %48 = mul i32 %47, %7
  %49 = mul i32 %45, %4
  br i1 %37, label %50, label %132

50:                                               ; preds = %44, %128
  %51 = phi i32 [ %130, %128 ], [ 0, %44 ]
  %52 = phi float [ %129, %128 ], [ %46, %44 ]
  %53 = add i32 %38, %51
  %54 = icmp sgt i32 %53, -1
  %55 = icmp slt i32 %53, %4
  %56 = add i32 %53, %49
  %57 = mul i32 %56, %3
  %58 = add i32 %51, %48
  %59 = mul i32 %58, %7
  br i1 %41, label %106, label %60

60:                                               ; preds = %50, %101
  %61 = phi i32 [ %103, %101 ], [ 0, %50 ]
  %62 = phi float [ %102, %101 ], [ %52, %50 ]
  %63 = phi i32 [ %104, %101 ], [ 0, %50 ]
  %64 = add i32 %39, %61
  %65 = icmp sgt i32 %64, -1
  %66 = select i1 %54, i1 %65, i1 false
  %67 = select i1 %66, i1 %55, i1 false
  %68 = icmp slt i32 %64, %3
  %69 = select i1 %67, i1 %68, i1 false
  br i1 %69, label %70, label %81

70:                                               ; preds = %60
  %71 = add i32 %64, %57
  %72 = add nsw i32 %61, %59
  %73 = sext i32 %71 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %0, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !7, !amdgpu.noclobber !5
  %76 = sext i32 %72 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %1, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !7, !amdgpu.noclobber !5
  %79 = fmul contract float %75, %78
  %80 = fadd contract float %62, %79
  br label %81

81:                                               ; preds = %60, %70
  %82 = phi float [ %80, %70 ], [ %62, %60 ]
  %83 = or i32 %61, 1
  %84 = add i32 %39, %83
  %85 = icmp sgt i32 %84, -1
  %86 = select i1 %54, i1 %85, i1 false
  %87 = select i1 %86, i1 %55, i1 false
  %88 = icmp slt i32 %84, %3
  %89 = select i1 %87, i1 %88, i1 false
  br i1 %89, label %90, label %101

90:                                               ; preds = %81
  %91 = add i32 %84, %57
  %92 = add nsw i32 %83, %59
  %93 = sext i32 %91 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %0, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !7, !amdgpu.noclobber !5
  %96 = sext i32 %92 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %1, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !7, !amdgpu.noclobber !5
  %99 = fmul contract float %95, %98
  %100 = fadd contract float %82, %99
  br label %101

101:                                              ; preds = %90, %81
  %102 = phi float [ %100, %90 ], [ %82, %81 ]
  %103 = add nuw nsw i32 %61, 2
  %104 = add i32 %63, 2
  %105 = icmp eq i32 %104, %42
  br i1 %105, label %106, label %60, !llvm.loop !11

106:                                              ; preds = %101, %50
  %107 = phi float [ undef, %50 ], [ %102, %101 ]
  %108 = phi i32 [ 0, %50 ], [ %103, %101 ]
  %109 = phi float [ %52, %50 ], [ %102, %101 ]
  br i1 %43, label %128, label %110

110:                                              ; preds = %106
  %111 = add i32 %39, %108
  %112 = icmp sgt i32 %111, -1
  %113 = select i1 %54, i1 %112, i1 false
  %114 = select i1 %113, i1 %55, i1 false
  %115 = icmp slt i32 %111, %3
  %116 = select i1 %114, i1 %115, i1 false
  br i1 %116, label %117, label %128

117:                                              ; preds = %110
  %118 = add i32 %111, %57
  %119 = add nsw i32 %108, %59
  %120 = sext i32 %118 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %0, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !7, !amdgpu.noclobber !5
  %123 = sext i32 %119 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %1, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !7, !amdgpu.noclobber !5
  %126 = fmul contract float %122, %125
  %127 = fadd contract float %109, %126
  br label %128

128:                                              ; preds = %110, %117, %106
  %129 = phi float [ %107, %106 ], [ %127, %117 ], [ %109, %110 ]
  %130 = add nuw nsw i32 %51, 1
  %131 = icmp eq i32 %130, %7
  br i1 %131, label %132, label %50, !llvm.loop !13

132:                                              ; preds = %128, %44
  %133 = phi float [ %46, %44 ], [ %129, %128 ]
  %134 = add nuw nsw i32 %45, 1
  %135 = icmp eq i32 %134, %5
  br i1 %135, label %136, label %44, !llvm.loop !14

136:                                              ; preds = %132, %29
  %137 = phi float [ 0.000000e+00, %29 ], [ %133, %132 ]
  %138 = sext i32 %33 to i64
  %139 = getelementptr inbounds float, float addrspace(1)* %2, i64 %138
  store float %137, float addrspace(1)* %139, align 4, !tbaa !7
  br label %140

140:                                              ; preds = %136, %9
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
