; ModuleID = '../data/hip_kernels/59/171/main.cu'
source_filename = "../data/hip_kernels/59/171/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z23kBoundingBoxSoftMaxGradPfPiS0_S0_S_S_S_iiiiffS_(float addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, i32 %7, i32 %8, i32 %9, i32 %10, float %11, float %12, float addrspace(1)* nocapture writeonly %13) local_unnamed_addr #0 {
  %15 = mul i32 %8, %7
  %16 = mul i32 %15, %9
  %17 = mul i32 %16, %10
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %20 = getelementptr i8, i8 addrspace(4)* %19, i64 4
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 4, !range !4, !invariant.load !5
  %23 = zext i16 %22 to i32
  %24 = getelementptr inbounds i8, i8 addrspace(4)* %19, i64 12
  %25 = bitcast i8 addrspace(4)* %24 to i32 addrspace(4)*
  %26 = load i32, i32 addrspace(4)* %25, align 4, !tbaa !6
  %27 = mul i32 %18, %23
  %28 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %29 = add i32 %27, %28
  %30 = udiv i32 %26, %23
  %31 = mul i32 %30, %23
  %32 = icmp ugt i32 %26, %31
  %33 = zext i1 %32 to i32
  %34 = add i32 %30, %33
  %35 = mul i32 %34, %23
  %36 = icmp ult i32 %29, %17
  br i1 %36, label %38, label %37

37:                                               ; preds = %146, %14
  ret void

38:                                               ; preds = %14, %146
  %39 = phi i32 [ %150, %146 ], [ %29, %14 ]
  %40 = freeze i32 %39
  %41 = freeze i32 %7
  %42 = sdiv i32 %40, %41
  %43 = mul i32 %42, %41
  %44 = sub i32 %40, %43
  %45 = freeze i32 %8
  %46 = sdiv i32 %42, %45
  %47 = mul i32 %46, %45
  %48 = sub i32 %42, %47
  %49 = sitofp i32 %48 to float
  %50 = fmul contract float %49, %11
  %51 = freeze i32 %9
  %52 = sdiv i32 %46, %51
  %53 = mul i32 %52, %51
  %54 = sub i32 %46, %53
  %55 = sitofp i32 %54 to float
  %56 = fmul contract float %55, %12
  %57 = srem i32 %52, %10
  %58 = sext i32 %44 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %4, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !16
  %61 = fptosi float %60 to i32
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %62
  %64 = bitcast i32 addrspace(1)* %63 to <2 x i32> addrspace(1)*
  %65 = load <2 x i32>, <2 x i32> addrspace(1)* %64, align 4, !tbaa !20
  %66 = extractelement <2 x i32> %65, i64 0
  %67 = extractelement <2 x i32> %65, i64 1
  %68 = icmp slt i32 %66, %67
  br i1 %68, label %69, label %132

69:                                               ; preds = %38
  %70 = getelementptr inbounds float, float addrspace(1)* %5, i64 %58
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !16
  %72 = getelementptr inbounds float, float addrspace(1)* %6, i64 %58
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !16
  br label %74

74:                                               ; preds = %69, %126
  %75 = phi i32 [ 0, %69 ], [ %120, %126 ]
  %76 = phi i32 [ 0, %69 ], [ %129, %126 ]
  %77 = phi i32 [ %66, %69 ], [ %130, %126 ]
  %78 = shl i32 %77, 2
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %79
  %81 = load i32, i32 addrspace(1)* %80, align 4, !tbaa !20, !amdgpu.noclobber !5
  %82 = sitofp i32 %81 to float
  %83 = fsub contract float %82, %71
  %84 = fptosi float %83 to i32
  %85 = sitofp i32 %84 to float
  %86 = fcmp contract ult float %50, %85
  br i1 %86, label %117, label %87

87:                                               ; preds = %74
  %88 = add nuw nsw i32 %78, 3
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %89
  %91 = load i32, i32 addrspace(1)* %90, align 4, !tbaa !20, !amdgpu.noclobber !5
  %92 = sitofp i32 %91 to float
  %93 = fsub contract float %92, %73
  %94 = fptosi float %93 to i32
  %95 = add nuw nsw i32 %78, 1
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %96
  %98 = load i32, i32 addrspace(1)* %97, align 4, !tbaa !20, !amdgpu.noclobber !5
  %99 = sitofp i32 %98 to float
  %100 = fsub contract float %99, %73
  %101 = fptosi float %100 to i32
  %102 = add nuw nsw i32 %78, 2
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %103
  %105 = load i32, i32 addrspace(1)* %104, align 4, !tbaa !20, !amdgpu.noclobber !5
  %106 = sitofp i32 %105 to float
  %107 = fsub contract float %106, %71
  %108 = fptosi float %107 to i32
  %109 = sitofp i32 %108 to float
  %110 = fcmp contract ole float %50, %109
  %111 = sitofp i32 %101 to float
  %112 = fcmp contract oge float %56, %111
  %113 = select i1 %110, i1 %112, i1 false
  %114 = sitofp i32 %94 to float
  %115 = fcmp contract ole float %56, %114
  %116 = select i1 %113, i1 %115, i1 false
  br label %117

117:                                              ; preds = %87, %74
  %118 = phi i1 [ false, %74 ], [ %116, %87 ]
  %119 = zext i1 %118 to i32
  %120 = add nuw nsw i32 %75, %119
  br i1 %118, label %121, label %126

121:                                              ; preds = %117
  %122 = sext i32 %77 to i64
  %123 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %122
  %124 = load i32, i32 addrspace(1)* %123, align 4, !tbaa !20, !amdgpu.noclobber !5
  %125 = icmp eq i32 %124, %57
  br label %126

126:                                              ; preds = %121, %117
  %127 = phi i1 [ false, %117 ], [ %125, %121 ]
  %128 = zext i1 %127 to i32
  %129 = add nuw nsw i32 %76, %128
  %130 = add nsw i32 %77, 1
  %131 = icmp slt i32 %130, %67
  br i1 %131, label %74, label %132, !llvm.loop !22

132:                                              ; preds = %126, %38
  %133 = phi i32 [ 0, %38 ], [ %129, %126 ]
  %134 = phi i32 [ 0, %38 ], [ %120, %126 ]
  %135 = zext i32 %39 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %0, i64 %135
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !16
  %138 = icmp eq i32 %134, 0
  br i1 %138, label %143, label %139

139:                                              ; preds = %132
  %140 = sitofp i32 %133 to float
  %141 = sitofp i32 %134 to float
  %142 = fdiv contract float %140, %141
  br label %146

143:                                              ; preds = %132
  %144 = icmp eq i32 %57, 0
  %145 = uitofp i1 %144 to float
  br label %146

146:                                              ; preds = %143, %139
  %147 = phi contract float [ %142, %139 ], [ %145, %143 ]
  %148 = fsub contract float %137, %147
  %149 = getelementptr inbounds float, float addrspace(1)* %13, i64 %135
  store float %148, float addrspace(1)* %149, align 4, !tbaa !16
  %150 = add i32 %39, %35
  %151 = icmp ult i32 %150, %17
  br i1 %151, label %38, label %37, !llvm.loop !24
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
!20 = !{!21, !21, i64 0}
!21 = !{!"int", !18, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !23}
