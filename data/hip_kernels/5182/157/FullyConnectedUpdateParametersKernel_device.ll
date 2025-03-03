; ModuleID = '../data/hip_kernels/5182/157/main.cu'
source_filename = "../data/hip_kernels/5182/157/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z36FullyConnectedUpdateParametersKernelPfS_S_S_S_S_S_ii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = getelementptr inbounds i8, i8 addrspace(4)* %10, i64 12
  %16 = bitcast i8 addrspace(4)* %15 to i32 addrspace(4)*
  %17 = load i32, i32 addrspace(4)* %16, align 4, !tbaa !6
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = udiv i32 %17, %14
  %21 = mul i32 %20, %14
  %22 = icmp ugt i32 %17, %21
  %23 = zext i1 %22 to i32
  %24 = add i32 %20, %23
  %25 = mul i32 %24, %19
  %26 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %27 = add i32 %25, %18
  %28 = mul i32 %27, %14
  %29 = add i32 %28, %26
  %30 = icmp slt i32 %29, %8
  br i1 %30, label %31, label %155

31:                                               ; preds = %9
  %32 = sext i32 %29 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %6, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !16, !amdgpu.noclobber !5
  %35 = fcmp contract une float %34, 0.000000e+00
  br i1 %35, label %155, label %36

36:                                               ; preds = %31
  %37 = icmp sgt i32 %7, 0
  br i1 %37, label %38, label %146

38:                                               ; preds = %36
  %39 = and i32 %7, 7
  %40 = icmp ult i32 %7, 8
  br i1 %40, label %128, label %41

41:                                               ; preds = %38
  %42 = and i32 %7, -8
  br label %43

43:                                               ; preds = %43, %41
  %44 = phi i32 [ %29, %41 ], [ %125, %43 ]
  %45 = phi i32 [ 0, %41 ], [ %126, %43 ]
  %46 = sext i32 %44 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %2, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !16
  %49 = getelementptr inbounds float, float addrspace(1)* %4, i64 %46
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !16
  %51 = fmul contract float %48, %50
  %52 = getelementptr inbounds float, float addrspace(1)* %0, i64 %46
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !16
  %54 = fsub contract float %53, %51
  store float %54, float addrspace(1)* %52, align 4, !tbaa !16
  %55 = add nsw i32 %44, %8
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %2, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !16
  %59 = getelementptr inbounds float, float addrspace(1)* %4, i64 %56
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !16
  %61 = fmul contract float %58, %60
  %62 = getelementptr inbounds float, float addrspace(1)* %0, i64 %56
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !16
  %64 = fsub contract float %63, %61
  store float %64, float addrspace(1)* %62, align 4, !tbaa !16
  %65 = add nsw i32 %55, %8
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %2, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !16
  %69 = getelementptr inbounds float, float addrspace(1)* %4, i64 %66
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !16
  %71 = fmul contract float %68, %70
  %72 = getelementptr inbounds float, float addrspace(1)* %0, i64 %66
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !16
  %74 = fsub contract float %73, %71
  store float %74, float addrspace(1)* %72, align 4, !tbaa !16
  %75 = add nsw i32 %65, %8
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %2, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !16
  %79 = getelementptr inbounds float, float addrspace(1)* %4, i64 %76
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !16
  %81 = fmul contract float %78, %80
  %82 = getelementptr inbounds float, float addrspace(1)* %0, i64 %76
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !16
  %84 = fsub contract float %83, %81
  store float %84, float addrspace(1)* %82, align 4, !tbaa !16
  %85 = add nsw i32 %75, %8
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %2, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !16
  %89 = getelementptr inbounds float, float addrspace(1)* %4, i64 %86
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !16
  %91 = fmul contract float %88, %90
  %92 = getelementptr inbounds float, float addrspace(1)* %0, i64 %86
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !16
  %94 = fsub contract float %93, %91
  store float %94, float addrspace(1)* %92, align 4, !tbaa !16
  %95 = add nsw i32 %85, %8
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %2, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !16
  %99 = getelementptr inbounds float, float addrspace(1)* %4, i64 %96
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !16
  %101 = fmul contract float %98, %100
  %102 = getelementptr inbounds float, float addrspace(1)* %0, i64 %96
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !16
  %104 = fsub contract float %103, %101
  store float %104, float addrspace(1)* %102, align 4, !tbaa !16
  %105 = add nsw i32 %95, %8
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %2, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !16
  %109 = getelementptr inbounds float, float addrspace(1)* %4, i64 %106
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !16
  %111 = fmul contract float %108, %110
  %112 = getelementptr inbounds float, float addrspace(1)* %0, i64 %106
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !16
  %114 = fsub contract float %113, %111
  store float %114, float addrspace(1)* %112, align 4, !tbaa !16
  %115 = add nsw i32 %105, %8
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %2, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !16
  %119 = getelementptr inbounds float, float addrspace(1)* %4, i64 %116
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !16
  %121 = fmul contract float %118, %120
  %122 = getelementptr inbounds float, float addrspace(1)* %0, i64 %116
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !16
  %124 = fsub contract float %123, %121
  store float %124, float addrspace(1)* %122, align 4, !tbaa !16
  %125 = add nsw i32 %115, %8
  %126 = add i32 %45, 8
  %127 = icmp eq i32 %126, %42
  br i1 %127, label %128, label %43, !llvm.loop !20

128:                                              ; preds = %43, %38
  %129 = phi i32 [ %29, %38 ], [ %125, %43 ]
  %130 = icmp eq i32 %39, 0
  br i1 %130, label %146, label %131

131:                                              ; preds = %128, %131
  %132 = phi i32 [ %143, %131 ], [ %129, %128 ]
  %133 = phi i32 [ %144, %131 ], [ 0, %128 ]
  %134 = sext i32 %132 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %2, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !16
  %137 = getelementptr inbounds float, float addrspace(1)* %4, i64 %134
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !16
  %139 = fmul contract float %136, %138
  %140 = getelementptr inbounds float, float addrspace(1)* %0, i64 %134
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !16
  %142 = fsub contract float %141, %139
  store float %142, float addrspace(1)* %140, align 4, !tbaa !16
  %143 = add nsw i32 %132, %8
  %144 = add i32 %133, 1
  %145 = icmp eq i32 %144, %39
  br i1 %145, label %146, label %131, !llvm.loop !22

146:                                              ; preds = %128, %131, %36
  %147 = getelementptr inbounds float, float addrspace(1)* %3, i64 %32
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !16
  %149 = getelementptr inbounds float, float addrspace(1)* %5, i64 %32
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !16
  %151 = fmul contract float %148, %150
  %152 = getelementptr inbounds float, float addrspace(1)* %1, i64 %32
  %153 = load float, float addrspace(1)* %152, align 4, !tbaa !16
  %154 = fsub contract float %153, %151
  store float %154, float addrspace(1)* %152, align 4, !tbaa !16
  br label %155

155:                                              ; preds = %31, %146, %9
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
