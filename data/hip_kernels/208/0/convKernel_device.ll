; ModuleID = '../data/hip_kernels/208/0/main.cu'
source_filename = "../data/hip_kernels/208/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10convKernelPKfS0_Pfi(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp slt i32 %13, %3
  br i1 %14, label %15, label %145

15:                                               ; preds = %4
  %16 = icmp sgt i32 %3, 0
  br i1 %16, label %17, label %47

17:                                               ; preds = %15
  %18 = lshr i32 %3, 1
  %19 = add nuw nsw i32 %18, %3
  %20 = add nsw i32 %19, %13
  %21 = and i32 %3, 7
  %22 = icmp ult i32 %3, 8
  br i1 %22, label %25, label %23

23:                                               ; preds = %17
  %24 = and i32 %3, -8
  br label %51

25:                                               ; preds = %51, %17
  %26 = phi float [ undef, %17 ], [ %141, %51 ]
  %27 = phi i32 [ 0, %17 ], [ %142, %51 ]
  %28 = phi float [ 0.000000e+00, %17 ], [ %141, %51 ]
  %29 = icmp eq i32 %21, 0
  br i1 %29, label %47, label %30

30:                                               ; preds = %25, %30
  %31 = phi i32 [ %44, %30 ], [ %27, %25 ]
  %32 = phi float [ %43, %30 ], [ %28, %25 ]
  %33 = phi i32 [ %45, %30 ], [ 0, %25 ]
  %34 = zext i32 %31 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %0, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !7, !amdgpu.noclobber !5
  %37 = sub i32 %20, %31
  %38 = srem i32 %37, %3
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %1, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !7, !amdgpu.noclobber !5
  %42 = fmul contract float %36, %41
  %43 = fadd contract float %32, %42
  %44 = add nuw nsw i32 %31, 1
  %45 = add i32 %33, 1
  %46 = icmp eq i32 %45, %21
  br i1 %46, label %47, label %30, !llvm.loop !11

47:                                               ; preds = %25, %30, %15
  %48 = phi float [ 0.000000e+00, %15 ], [ %26, %25 ], [ %43, %30 ]
  %49 = sext i32 %13 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %2, i64 %49
  store float %48, float addrspace(1)* %50, align 4, !tbaa !7
  br label %145

51:                                               ; preds = %51, %23
  %52 = phi i32 [ 0, %23 ], [ %142, %51 ]
  %53 = phi float [ 0.000000e+00, %23 ], [ %141, %51 ]
  %54 = phi i32 [ 0, %23 ], [ %143, %51 ]
  %55 = zext i32 %52 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %0, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !7, !amdgpu.noclobber !5
  %58 = sub i32 %20, %52
  %59 = srem i32 %58, %3
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %1, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !7, !amdgpu.noclobber !5
  %63 = fmul contract float %57, %62
  %64 = fadd contract float %53, %63
  %65 = or i32 %52, 1
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %0, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !7, !amdgpu.noclobber !5
  %69 = sub i32 %20, %65
  %70 = srem i32 %69, %3
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %1, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !7, !amdgpu.noclobber !5
  %74 = fmul contract float %68, %73
  %75 = fadd contract float %64, %74
  %76 = or i32 %52, 2
  %77 = zext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %0, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7, !amdgpu.noclobber !5
  %80 = sub i32 %20, %76
  %81 = srem i32 %80, %3
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %1, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !7, !amdgpu.noclobber !5
  %85 = fmul contract float %79, %84
  %86 = fadd contract float %75, %85
  %87 = or i32 %52, 3
  %88 = zext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %0, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !7, !amdgpu.noclobber !5
  %91 = sub i32 %20, %87
  %92 = srem i32 %91, %3
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %1, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !7, !amdgpu.noclobber !5
  %96 = fmul contract float %90, %95
  %97 = fadd contract float %86, %96
  %98 = or i32 %52, 4
  %99 = zext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %0, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !7, !amdgpu.noclobber !5
  %102 = sub i32 %20, %98
  %103 = srem i32 %102, %3
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %1, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !7, !amdgpu.noclobber !5
  %107 = fmul contract float %101, %106
  %108 = fadd contract float %97, %107
  %109 = or i32 %52, 5
  %110 = zext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %0, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !7, !amdgpu.noclobber !5
  %113 = sub i32 %20, %109
  %114 = srem i32 %113, %3
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %1, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !7, !amdgpu.noclobber !5
  %118 = fmul contract float %112, %117
  %119 = fadd contract float %108, %118
  %120 = or i32 %52, 6
  %121 = zext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %0, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !7, !amdgpu.noclobber !5
  %124 = sub i32 %20, %120
  %125 = srem i32 %124, %3
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %1, i64 %126
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !7, !amdgpu.noclobber !5
  %129 = fmul contract float %123, %128
  %130 = fadd contract float %119, %129
  %131 = or i32 %52, 7
  %132 = zext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %0, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !7, !amdgpu.noclobber !5
  %135 = sub i32 %20, %131
  %136 = srem i32 %135, %3
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds float, float addrspace(1)* %1, i64 %137
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !7, !amdgpu.noclobber !5
  %140 = fmul contract float %134, %139
  %141 = fadd contract float %130, %140
  %142 = add nuw nsw i32 %52, 8
  %143 = add i32 %54, 8
  %144 = icmp eq i32 %143, %24
  br i1 %144, label %25, label %51, !llvm.loop !13

145:                                              ; preds = %4, %47
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
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
