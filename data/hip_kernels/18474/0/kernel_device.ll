; ModuleID = '../data/hip_kernels/18474/0/main.cu'
source_filename = "../data/hip_kernels/18474/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z6kerneljjPfS_S_(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = add i32 %13, %6
  %15 = icmp eq i32 %1, 0
  br i1 %15, label %137, label %16

16:                                               ; preds = %5
  %17 = and i32 %1, 7
  %18 = icmp ult i32 %1, 8
  br i1 %18, label %115, label %19

19:                                               ; preds = %16
  %20 = and i32 %1, -8
  br label %21

21:                                               ; preds = %21, %19
  %22 = phi i32 [ 0, %19 ], [ %112, %21 ]
  %23 = phi float [ 0.000000e+00, %19 ], [ %111, %21 ]
  %24 = phi i32 [ 0, %19 ], [ %113, %21 ]
  %25 = mul i32 %22, %0
  %26 = add i32 %25, %14
  %27 = zext i32 %26 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %2, i64 %27
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !7, !amdgpu.noclobber !6
  %30 = zext i32 %22 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %3, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !7, !amdgpu.noclobber !6
  %33 = fmul contract float %29, %32
  %34 = fadd contract float %23, %33
  %35 = or i32 %22, 1
  %36 = mul i32 %35, %0
  %37 = add i32 %36, %14
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %2, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !7, !amdgpu.noclobber !6
  %41 = zext i32 %35 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %3, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !6
  %44 = fmul contract float %40, %43
  %45 = fadd contract float %34, %44
  %46 = or i32 %22, 2
  %47 = mul i32 %46, %0
  %48 = add i32 %47, %14
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %2, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !7, !amdgpu.noclobber !6
  %52 = zext i32 %46 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %3, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !7, !amdgpu.noclobber !6
  %55 = fmul contract float %51, %54
  %56 = fadd contract float %45, %55
  %57 = or i32 %22, 3
  %58 = mul i32 %57, %0
  %59 = add i32 %58, %14
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %2, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !7, !amdgpu.noclobber !6
  %63 = zext i32 %57 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %3, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7, !amdgpu.noclobber !6
  %66 = fmul contract float %62, %65
  %67 = fadd contract float %56, %66
  %68 = or i32 %22, 4
  %69 = mul i32 %68, %0
  %70 = add i32 %69, %14
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %2, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !7, !amdgpu.noclobber !6
  %74 = zext i32 %68 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %3, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !7, !amdgpu.noclobber !6
  %77 = fmul contract float %73, %76
  %78 = fadd contract float %67, %77
  %79 = or i32 %22, 5
  %80 = mul i32 %79, %0
  %81 = add i32 %80, %14
  %82 = zext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %2, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !7, !amdgpu.noclobber !6
  %85 = zext i32 %79 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %3, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !7, !amdgpu.noclobber !6
  %88 = fmul contract float %84, %87
  %89 = fadd contract float %78, %88
  %90 = or i32 %22, 6
  %91 = mul i32 %90, %0
  %92 = add i32 %91, %14
  %93 = zext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %2, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !7, !amdgpu.noclobber !6
  %96 = zext i32 %90 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %3, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !7, !amdgpu.noclobber !6
  %99 = fmul contract float %95, %98
  %100 = fadd contract float %89, %99
  %101 = or i32 %22, 7
  %102 = mul i32 %101, %0
  %103 = add i32 %102, %14
  %104 = zext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %2, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !7, !amdgpu.noclobber !6
  %107 = zext i32 %101 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %3, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !7, !amdgpu.noclobber !6
  %110 = fmul contract float %106, %109
  %111 = fadd contract float %100, %110
  %112 = add nuw nsw i32 %22, 8
  %113 = add i32 %24, 8
  %114 = icmp eq i32 %113, %20
  br i1 %114, label %115, label %21, !llvm.loop !11

115:                                              ; preds = %21, %16
  %116 = phi float [ undef, %16 ], [ %111, %21 ]
  %117 = phi i32 [ 0, %16 ], [ %112, %21 ]
  %118 = phi float [ 0.000000e+00, %16 ], [ %111, %21 ]
  %119 = icmp eq i32 %17, 0
  br i1 %119, label %137, label %120

120:                                              ; preds = %115, %120
  %121 = phi i32 [ %134, %120 ], [ %117, %115 ]
  %122 = phi float [ %133, %120 ], [ %118, %115 ]
  %123 = phi i32 [ %135, %120 ], [ 0, %115 ]
  %124 = mul i32 %121, %0
  %125 = add i32 %124, %14
  %126 = zext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %2, i64 %126
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !7, !amdgpu.noclobber !6
  %129 = zext i32 %121 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %3, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !7, !amdgpu.noclobber !6
  %132 = fmul contract float %128, %131
  %133 = fadd contract float %122, %132
  %134 = add nuw nsw i32 %121, 1
  %135 = add i32 %123, 1
  %136 = icmp eq i32 %135, %17
  br i1 %136, label %137, label %120, !llvm.loop !13

137:                                              ; preds = %115, %120, %5
  %138 = phi float [ 0.000000e+00, %5 ], [ %116, %115 ], [ %133, %120 ]
  %139 = sext i32 %14 to i64
  %140 = getelementptr inbounds float, float addrspace(1)* %4, i64 %139
  store float %138, float addrspace(1)* %140, align 4, !tbaa !7
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
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
