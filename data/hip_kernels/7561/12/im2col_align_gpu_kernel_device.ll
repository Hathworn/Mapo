; ModuleID = '../data/hip_kernels/7561/12/main.cu'
source_filename = "../data/hip_kernels/7561/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z23im2col_align_gpu_kerneliPKfiiiiiiiPfi(i32 %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, float addrspace(1)* nocapture writeonly %9, i32 %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = getelementptr inbounds i8, i8 addrspace(4)* %13, i64 12
  %19 = bitcast i8 addrspace(4)* %18 to i32 addrspace(4)*
  %20 = load i32, i32 addrspace(4)* %19, align 4, !tbaa !6
  %21 = mul i32 %12, %17
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %23 = add i32 %21, %22
  %24 = icmp slt i32 %23, %0
  br i1 %24, label %25, label %184

25:                                               ; preds = %11
  %26 = mul i32 %4, %4
  %27 = icmp sgt i32 %4, 0
  %28 = mul nsw i32 %8, %7
  %29 = udiv i32 %20, %17
  %30 = mul i32 %29, %17
  %31 = icmp ugt i32 %20, %30
  %32 = zext i1 %31 to i32
  %33 = add i32 %29, %32
  %34 = mul i32 %33, %17
  %35 = and i32 %4, 3
  %36 = icmp ult i32 %4, 4
  %37 = and i32 %4, -4
  %38 = icmp eq i32 %35, 0
  br label %39

39:                                               ; preds = %25, %71
  %40 = phi i32 [ %23, %25 ], [ %72, %71 ]
  %41 = freeze i32 %40
  %42 = freeze i32 %8
  %43 = sdiv i32 %41, %42
  %44 = mul i32 %43, %42
  %45 = sub i32 %41, %44
  %46 = freeze i32 %7
  %47 = sdiv i32 %43, %46
  %48 = mul i32 %47, %46
  %49 = sub i32 %43, %48
  %50 = mul i32 %26, %47
  %51 = mul nsw i32 %49, %6
  %52 = sub nsw i32 %51, %5
  %53 = mul nsw i32 %45, %6
  %54 = sub nsw i32 %53, %5
  %55 = mul nsw i32 %47, %2
  %56 = add nsw i32 %55, %52
  %57 = mul nsw i32 %56, %3
  %58 = add nsw i32 %57, %54
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %1, i64 %59
  br i1 %27, label %61, label %71

61:                                               ; preds = %39
  %62 = srem i32 %40, %28
  br label %63

63:                                               ; preds = %61, %100
  %64 = phi i32 [ %101, %100 ], [ 0, %61 ]
  %65 = add nsw i32 %64, %52
  %66 = icmp sgt i32 %65, -1
  %67 = icmp slt i32 %65, %2
  %68 = mul nsw i32 %64, %3
  %69 = mul nsw i32 %64, %4
  %70 = add nsw i32 %69, %50
  br i1 %36, label %74, label %103

71:                                               ; preds = %100, %39
  %72 = add i32 %34, %40
  %73 = icmp slt i32 %72, %0
  br i1 %73, label %39, label %184, !llvm.loop !16

74:                                               ; preds = %174, %63
  %75 = phi i32 [ 0, %63 ], [ %181, %174 ]
  br i1 %38, label %100, label %76

76:                                               ; preds = %74, %90
  %77 = phi i32 [ %97, %90 ], [ %75, %74 ]
  %78 = phi i32 [ %98, %90 ], [ 0, %74 ]
  %79 = add nsw i32 %77, %54
  %80 = icmp sgt i32 %79, -1
  %81 = select i1 %66, i1 %80, i1 false
  %82 = select i1 %81, i1 %67, i1 false
  %83 = icmp slt i32 %79, %3
  %84 = select i1 %82, i1 %83, i1 false
  br i1 %84, label %85, label %90

85:                                               ; preds = %76
  %86 = add nsw i32 %77, %68
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %60, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !18
  br label %90

90:                                               ; preds = %85, %76
  %91 = phi contract float [ %89, %85 ], [ 0.000000e+00, %76 ]
  %92 = add nsw i32 %70, %77
  %93 = mul nsw i32 %92, %10
  %94 = add nsw i32 %62, %93
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %9, i64 %95
  store float %91, float addrspace(1)* %96, align 4, !tbaa !18
  %97 = add nuw nsw i32 %77, 1
  %98 = add i32 %78, 1
  %99 = icmp eq i32 %98, %35
  br i1 %99, label %100, label %76, !llvm.loop !22

100:                                              ; preds = %90, %74
  %101 = add nuw nsw i32 %64, 1
  %102 = icmp eq i32 %101, %4
  br i1 %102, label %71, label %63, !llvm.loop !24

103:                                              ; preds = %63, %174
  %104 = phi i32 [ %181, %174 ], [ 0, %63 ]
  %105 = phi i32 [ %182, %174 ], [ 0, %63 ]
  %106 = add nsw i32 %104, %54
  %107 = icmp sgt i32 %106, -1
  %108 = select i1 %66, i1 %107, i1 false
  %109 = select i1 %108, i1 %67, i1 false
  %110 = icmp slt i32 %106, %3
  %111 = select i1 %109, i1 %110, i1 false
  br i1 %111, label %112, label %117

112:                                              ; preds = %103
  %113 = add nsw i32 %104, %68
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %60, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !18
  br label %117

117:                                              ; preds = %103, %112
  %118 = phi contract float [ %116, %112 ], [ 0.000000e+00, %103 ]
  %119 = add nsw i32 %70, %104
  %120 = mul nsw i32 %119, %10
  %121 = add nsw i32 %62, %120
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %9, i64 %122
  store float %118, float addrspace(1)* %123, align 4, !tbaa !18
  %124 = or i32 %104, 1
  %125 = add nsw i32 %124, %54
  %126 = icmp sgt i32 %125, -1
  %127 = select i1 %66, i1 %126, i1 false
  %128 = select i1 %127, i1 %67, i1 false
  %129 = icmp slt i32 %125, %3
  %130 = select i1 %128, i1 %129, i1 false
  br i1 %130, label %131, label %136

131:                                              ; preds = %117
  %132 = add nsw i32 %124, %68
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %60, i64 %133
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !18
  br label %136

136:                                              ; preds = %131, %117
  %137 = phi contract float [ %135, %131 ], [ 0.000000e+00, %117 ]
  %138 = add nsw i32 %70, %124
  %139 = mul nsw i32 %138, %10
  %140 = add nsw i32 %62, %139
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %9, i64 %141
  store float %137, float addrspace(1)* %142, align 4, !tbaa !18
  %143 = or i32 %104, 2
  %144 = add nsw i32 %143, %54
  %145 = icmp sgt i32 %144, -1
  %146 = select i1 %66, i1 %145, i1 false
  %147 = select i1 %146, i1 %67, i1 false
  %148 = icmp slt i32 %144, %3
  %149 = select i1 %147, i1 %148, i1 false
  br i1 %149, label %150, label %155

150:                                              ; preds = %136
  %151 = add nsw i32 %143, %68
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds float, float addrspace(1)* %60, i64 %152
  %154 = load float, float addrspace(1)* %153, align 4, !tbaa !18
  br label %155

155:                                              ; preds = %150, %136
  %156 = phi contract float [ %154, %150 ], [ 0.000000e+00, %136 ]
  %157 = add nsw i32 %70, %143
  %158 = mul nsw i32 %157, %10
  %159 = add nsw i32 %62, %158
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds float, float addrspace(1)* %9, i64 %160
  store float %156, float addrspace(1)* %161, align 4, !tbaa !18
  %162 = or i32 %104, 3
  %163 = add nsw i32 %162, %54
  %164 = icmp sgt i32 %163, -1
  %165 = select i1 %66, i1 %164, i1 false
  %166 = select i1 %165, i1 %67, i1 false
  %167 = icmp slt i32 %163, %3
  %168 = select i1 %166, i1 %167, i1 false
  br i1 %168, label %169, label %174

169:                                              ; preds = %155
  %170 = add nsw i32 %162, %68
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds float, float addrspace(1)* %60, i64 %171
  %173 = load float, float addrspace(1)* %172, align 4, !tbaa !18
  br label %174

174:                                              ; preds = %169, %155
  %175 = phi contract float [ %173, %169 ], [ 0.000000e+00, %155 ]
  %176 = add nsw i32 %70, %162
  %177 = mul nsw i32 %176, %10
  %178 = add nsw i32 %62, %177
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds float, float addrspace(1)* %9, i64 %179
  store float %175, float addrspace(1)* %180, align 4, !tbaa !18
  %181 = add nuw nsw i32 %104, 4
  %182 = add i32 %105, 4
  %183 = icmp eq i32 %182, %37
  br i1 %183, label %74, label %103, !llvm.loop !25

184:                                              ; preds = %71, %11
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
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.mustprogress"}
!18 = !{!19, !19, i64 0}
!19 = !{!"float", !20, i64 0}
!20 = !{!"omnipotent char", !21, i64 0}
!21 = !{!"Simple C++ TBAA"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
!24 = distinct !{!24, !17}
!25 = distinct !{!25, !17}
