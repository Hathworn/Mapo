; ModuleID = '../data/hip_kernels/14264/0/main.cu'
source_filename = "../data/hip_kernels/14264/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z24createMovieRatingsKernelPKfS0_Pfii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !6
  %15 = mul i32 %6, %11
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %17 = add i32 %15, %16
  %18 = mul nsw i32 %3, 5
  %19 = icmp ult i32 %17, %18
  br i1 %19, label %20, label %148

20:                                               ; preds = %5
  %21 = icmp eq i32 %4, 0
  %22 = udiv i32 %14, %11
  %23 = mul i32 %22, %11
  %24 = icmp ugt i32 %14, %23
  %25 = zext i1 %24 to i32
  %26 = add i32 %22, %25
  %27 = mul i32 %26, %11
  %28 = and i32 %4, 7
  %29 = icmp ult i32 %4, 8
  %30 = and i32 %4, -8
  %31 = icmp eq i32 %28, 0
  br label %32

32:                                               ; preds = %20, %142
  %33 = phi i32 [ %17, %20 ], [ %146, %142 ]
  br i1 %21, label %142, label %34

34:                                               ; preds = %32
  %35 = mul i32 %33, %4
  br i1 %29, label %122, label %36

36:                                               ; preds = %34, %36
  %37 = phi float [ %118, %36 ], [ 0.000000e+00, %34 ]
  %38 = phi i32 [ %119, %36 ], [ 0, %34 ]
  %39 = phi i32 [ %120, %36 ], [ 0, %34 ]
  %40 = add i32 %38, %35
  %41 = zext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !16
  %44 = zext i32 %38 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %1, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !16
  %47 = fmul contract float %43, %46
  %48 = fadd contract float %37, %47
  %49 = or i32 %38, 1
  %50 = add i32 %49, %35
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %0, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !16
  %54 = zext i32 %49 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %1, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !16
  %57 = fmul contract float %53, %56
  %58 = fadd contract float %48, %57
  %59 = or i32 %38, 2
  %60 = add i32 %59, %35
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %0, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !16
  %64 = zext i32 %59 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %1, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !16
  %67 = fmul contract float %63, %66
  %68 = fadd contract float %58, %67
  %69 = or i32 %38, 3
  %70 = add i32 %69, %35
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %0, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !16
  %74 = zext i32 %69 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %1, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !16
  %77 = fmul contract float %73, %76
  %78 = fadd contract float %68, %77
  %79 = or i32 %38, 4
  %80 = add i32 %79, %35
  %81 = zext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %0, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !16
  %84 = zext i32 %79 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %1, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !16
  %87 = fmul contract float %83, %86
  %88 = fadd contract float %78, %87
  %89 = or i32 %38, 5
  %90 = add i32 %89, %35
  %91 = zext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %0, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !16
  %94 = zext i32 %89 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %1, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !16
  %97 = fmul contract float %93, %96
  %98 = fadd contract float %88, %97
  %99 = or i32 %38, 6
  %100 = add i32 %99, %35
  %101 = zext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %0, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !16
  %104 = zext i32 %99 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %1, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !16
  %107 = fmul contract float %103, %106
  %108 = fadd contract float %98, %107
  %109 = or i32 %38, 7
  %110 = add i32 %109, %35
  %111 = zext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %0, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !16
  %114 = zext i32 %109 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %1, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !16
  %117 = fmul contract float %113, %116
  %118 = fadd contract float %108, %117
  %119 = add nuw i32 %38, 8
  %120 = add i32 %39, 8
  %121 = icmp eq i32 %120, %30
  br i1 %121, label %122, label %36, !llvm.loop !20

122:                                              ; preds = %36, %34
  %123 = phi float [ undef, %34 ], [ %118, %36 ]
  %124 = phi float [ 0.000000e+00, %34 ], [ %118, %36 ]
  %125 = phi i32 [ 0, %34 ], [ %119, %36 ]
  br i1 %31, label %142, label %126

126:                                              ; preds = %122, %126
  %127 = phi float [ %138, %126 ], [ %124, %122 ]
  %128 = phi i32 [ %139, %126 ], [ %125, %122 ]
  %129 = phi i32 [ %140, %126 ], [ 0, %122 ]
  %130 = add i32 %128, %35
  %131 = zext i32 %130 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %0, i64 %131
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !16
  %134 = zext i32 %128 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %1, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !16
  %137 = fmul contract float %133, %136
  %138 = fadd contract float %127, %137
  %139 = add nuw i32 %128, 1
  %140 = add i32 %129, 1
  %141 = icmp eq i32 %140, %28
  br i1 %141, label %142, label %126, !llvm.loop !22

142:                                              ; preds = %122, %126, %32
  %143 = phi float [ 0.000000e+00, %32 ], [ %123, %122 ], [ %138, %126 ]
  %144 = zext i32 %33 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %2, i64 %144
  store float %143, float addrspace(1)* %145, align 4, !tbaa !16
  %146 = add i32 %27, %33
  %147 = icmp ult i32 %146, %18
  br i1 %147, label %32, label %148, !llvm.loop !24

148:                                              ; preds = %142, %5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
!24 = distinct !{!24, !21}
