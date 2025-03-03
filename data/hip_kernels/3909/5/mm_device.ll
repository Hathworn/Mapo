; ModuleID = '../data/hip_kernels/3909/5/main.cu'
source_filename = "../data/hip_kernels/3909/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z2mmPfS_S_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = freeze i32 %15
  %17 = icmp sgt i32 %16, %5
  br i1 %17, label %156, label %18

18:                                               ; preds = %6
  %19 = srem i32 %16, %3
  %20 = icmp sgt i32 %3, 0
  br i1 %20, label %21, label %50

21:                                               ; preds = %18
  %22 = sub nsw i32 %16, %19
  %23 = and i32 %3, 7
  %24 = icmp ult i32 %3, 8
  br i1 %24, label %27, label %25

25:                                               ; preds = %21
  %26 = and i32 %3, -8
  br label %54

27:                                               ; preds = %54, %21
  %28 = phi float [ undef, %21 ], [ %152, %54 ]
  %29 = phi i32 [ 0, %21 ], [ %153, %54 ]
  %30 = phi float [ 0.000000e+00, %21 ], [ %152, %54 ]
  %31 = icmp eq i32 %23, 0
  br i1 %31, label %50, label %32

32:                                               ; preds = %27, %32
  %33 = phi i32 [ %47, %32 ], [ %29, %27 ]
  %34 = phi float [ %46, %32 ], [ %30, %27 ]
  %35 = phi i32 [ %48, %32 ], [ 0, %27 ]
  %36 = add nsw i32 %22, %33
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %0, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !7, !amdgpu.noclobber !5
  %40 = mul nsw i32 %33, %3
  %41 = add nsw i32 %40, %19
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %1, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !7, !amdgpu.noclobber !5
  %45 = fmul contract float %39, %44
  %46 = fadd contract float %34, %45
  %47 = add nuw nsw i32 %33, 1
  %48 = add i32 %35, 1
  %49 = icmp eq i32 %48, %23
  br i1 %49, label %50, label %32, !llvm.loop !11

50:                                               ; preds = %27, %32, %18
  %51 = phi float [ 0.000000e+00, %18 ], [ %28, %27 ], [ %46, %32 ]
  %52 = sext i32 %16 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %2, i64 %52
  store float %51, float addrspace(1)* %53, align 4, !tbaa !7
  br label %156

54:                                               ; preds = %54, %25
  %55 = phi i32 [ 0, %25 ], [ %153, %54 ]
  %56 = phi float [ 0.000000e+00, %25 ], [ %152, %54 ]
  %57 = phi i32 [ 0, %25 ], [ %154, %54 ]
  %58 = add nsw i32 %22, %55
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %0, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !7, !amdgpu.noclobber !5
  %62 = mul nsw i32 %55, %3
  %63 = add nsw i32 %62, %19
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %1, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !7, !amdgpu.noclobber !5
  %67 = fmul contract float %61, %66
  %68 = fadd contract float %56, %67
  %69 = or i32 %55, 1
  %70 = add nsw i32 %22, %69
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %0, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !7, !amdgpu.noclobber !5
  %74 = mul nsw i32 %69, %3
  %75 = add nsw i32 %74, %19
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %1, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !7, !amdgpu.noclobber !5
  %79 = fmul contract float %73, %78
  %80 = fadd contract float %68, %79
  %81 = or i32 %55, 2
  %82 = add nsw i32 %22, %81
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %0, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !7, !amdgpu.noclobber !5
  %86 = mul nsw i32 %81, %3
  %87 = add nsw i32 %86, %19
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %1, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !7, !amdgpu.noclobber !5
  %91 = fmul contract float %85, %90
  %92 = fadd contract float %80, %91
  %93 = or i32 %55, 3
  %94 = add nsw i32 %22, %93
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %0, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !7, !amdgpu.noclobber !5
  %98 = mul nsw i32 %93, %3
  %99 = add nsw i32 %98, %19
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %1, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !7, !amdgpu.noclobber !5
  %103 = fmul contract float %97, %102
  %104 = fadd contract float %92, %103
  %105 = or i32 %55, 4
  %106 = add nsw i32 %22, %105
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %0, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !7, !amdgpu.noclobber !5
  %110 = mul nsw i32 %105, %3
  %111 = add nsw i32 %110, %19
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %1, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !7, !amdgpu.noclobber !5
  %115 = fmul contract float %109, %114
  %116 = fadd contract float %104, %115
  %117 = or i32 %55, 5
  %118 = add nsw i32 %22, %117
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %0, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !7, !amdgpu.noclobber !5
  %122 = mul nsw i32 %117, %3
  %123 = add nsw i32 %122, %19
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %1, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !7, !amdgpu.noclobber !5
  %127 = fmul contract float %121, %126
  %128 = fadd contract float %116, %127
  %129 = or i32 %55, 6
  %130 = add nsw i32 %22, %129
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %0, i64 %131
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !7, !amdgpu.noclobber !5
  %134 = mul nsw i32 %129, %3
  %135 = add nsw i32 %134, %19
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %1, i64 %136
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !7, !amdgpu.noclobber !5
  %139 = fmul contract float %133, %138
  %140 = fadd contract float %128, %139
  %141 = or i32 %55, 7
  %142 = add nsw i32 %22, %141
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds float, float addrspace(1)* %0, i64 %143
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !7, !amdgpu.noclobber !5
  %146 = mul nsw i32 %141, %3
  %147 = add nsw i32 %146, %19
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds float, float addrspace(1)* %1, i64 %148
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !7, !amdgpu.noclobber !5
  %151 = fmul contract float %145, %150
  %152 = fadd contract float %140, %151
  %153 = add nuw nsw i32 %55, 8
  %154 = add i32 %57, 8
  %155 = icmp eq i32 %154, %26
  br i1 %155, label %27, label %54, !llvm.loop !13

156:                                              ; preds = %50, %6
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
