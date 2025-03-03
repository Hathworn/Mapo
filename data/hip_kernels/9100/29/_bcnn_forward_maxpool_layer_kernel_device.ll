; ModuleID = '../data/hip_kernels/9100/29/main.cu'
source_filename = "../data/hip_kernels/9100/29/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z34_bcnn_forward_maxpool_layer_kerneliiiiiiPfS_Pi(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture writeonly %7, i32 addrspace(1)* nocapture writeonly %8) local_unnamed_addr #0 {
  %10 = add nsw i32 %1, -1
  %11 = sdiv i32 %10, %4
  %12 = add nsw i32 %11, 1
  %13 = add nsw i32 %2, -1
  %14 = sdiv i32 %13, %4
  %15 = add nsw i32 %14, 1
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %19 = getelementptr inbounds i8, i8 addrspace(4)* %18, i64 12
  %20 = bitcast i8 addrspace(4)* %19 to i32 addrspace(4)*
  %21 = load i32, i32 addrspace(4)* %20, align 4, !tbaa !4
  %22 = getelementptr i8, i8 addrspace(4)* %18, i64 4
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 4, !range !13, !invariant.load !14
  %25 = zext i16 %24 to i32
  %26 = udiv i32 %21, %25
  %27 = mul i32 %26, %25
  %28 = icmp ugt i32 %21, %27
  %29 = zext i1 %28 to i32
  %30 = add i32 %26, %29
  %31 = mul i32 %30, %17
  %32 = add i32 %31, %16
  %33 = mul i32 %32, %25
  %34 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %35 = add i32 %33, %34
  %36 = icmp slt i32 %35, %0
  br i1 %36, label %37, label %186

37:                                               ; preds = %9
  %38 = freeze i32 %35
  %39 = freeze i32 %15
  %40 = sdiv i32 %38, %39
  %41 = mul i32 %40, %39
  %42 = sub i32 %38, %41
  %43 = freeze i32 %12
  %44 = sdiv i32 %40, %43
  %45 = mul i32 %44, %43
  %46 = sub i32 %40, %45
  %47 = freeze i32 %44
  %48 = mul nsw i32 %47, %12
  %49 = add nsw i32 %48, %46
  %50 = mul nsw i32 %49, %15
  %51 = add nsw i32 %50, %42
  %52 = icmp sgt i32 %5, 0
  br i1 %52, label %53, label %180

53:                                               ; preds = %37
  %54 = mul nsw i32 %46, %4
  %55 = mul nsw i32 %42, %4
  %56 = mul nsw i32 %47, %1
  %57 = and i32 %5, 3
  %58 = icmp ult i32 %5, 4
  %59 = and i32 %5, -4
  %60 = icmp eq i32 %57, 0
  br label %61

61:                                               ; preds = %53, %175
  %62 = phi float [ 0xFFF0000000000000, %53 ], [ %177, %175 ]
  %63 = phi i32 [ -1, %53 ], [ %176, %175 ]
  %64 = phi i32 [ 0, %53 ], [ %178, %175 ]
  %65 = add nsw i32 %64, %54
  %66 = add nsw i32 %65, %56
  %67 = mul nsw i32 %66, %2
  %68 = icmp sgt i32 %65, -1
  %69 = icmp slt i32 %65, %1
  br i1 %58, label %145, label %70

70:                                               ; preds = %61, %137
  %71 = phi float [ %141, %137 ], [ %62, %61 ]
  %72 = phi i32 [ %140, %137 ], [ %63, %61 ]
  %73 = phi i32 [ %142, %137 ], [ 0, %61 ]
  %74 = phi i32 [ %143, %137 ], [ 0, %61 ]
  %75 = add nsw i32 %73, %55
  %76 = add nsw i32 %75, %67
  br i1 %68, label %77, label %86

77:                                               ; preds = %70
  %78 = icmp sgt i32 %75, -1
  %79 = select i1 %69, i1 %78, i1 false
  %80 = icmp slt i32 %75, %2
  %81 = select i1 %79, i1 %80, i1 false
  br i1 %81, label %82, label %86

82:                                               ; preds = %77
  %83 = sext i32 %76 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %6, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !16, !amdgpu.noclobber !14
  br label %86

86:                                               ; preds = %70, %77, %82
  %87 = phi contract float [ %85, %82 ], [ 0xFFF0000000000000, %77 ], [ 0xFFF0000000000000, %70 ]
  %88 = fcmp contract ogt float %87, %71
  %89 = select i1 %88, i32 %76, i32 %72
  %90 = select contract i1 %88, float %87, float %71
  %91 = or i32 %73, 1
  %92 = add nsw i32 %91, %55
  %93 = add nsw i32 %92, %67
  br i1 %68, label %94, label %103

94:                                               ; preds = %86
  %95 = icmp sgt i32 %92, -1
  %96 = select i1 %69, i1 %95, i1 false
  %97 = icmp slt i32 %92, %2
  %98 = select i1 %96, i1 %97, i1 false
  br i1 %98, label %99, label %103

99:                                               ; preds = %94
  %100 = sext i32 %93 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %6, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !16, !amdgpu.noclobber !14
  br label %103

103:                                              ; preds = %99, %94, %86
  %104 = phi contract float [ %102, %99 ], [ 0xFFF0000000000000, %94 ], [ 0xFFF0000000000000, %86 ]
  %105 = fcmp contract ogt float %104, %90
  %106 = select i1 %105, i32 %93, i32 %89
  %107 = select contract i1 %105, float %104, float %90
  %108 = or i32 %73, 2
  %109 = add nsw i32 %108, %55
  %110 = add nsw i32 %109, %67
  br i1 %68, label %111, label %120

111:                                              ; preds = %103
  %112 = icmp sgt i32 %109, -1
  %113 = select i1 %69, i1 %112, i1 false
  %114 = icmp slt i32 %109, %2
  %115 = select i1 %113, i1 %114, i1 false
  br i1 %115, label %116, label %120

116:                                              ; preds = %111
  %117 = sext i32 %110 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %6, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !16, !amdgpu.noclobber !14
  br label %120

120:                                              ; preds = %116, %111, %103
  %121 = phi contract float [ %119, %116 ], [ 0xFFF0000000000000, %111 ], [ 0xFFF0000000000000, %103 ]
  %122 = fcmp contract ogt float %121, %107
  %123 = select i1 %122, i32 %110, i32 %106
  %124 = select contract i1 %122, float %121, float %107
  %125 = or i32 %73, 3
  %126 = add nsw i32 %125, %55
  %127 = add nsw i32 %126, %67
  br i1 %68, label %128, label %137

128:                                              ; preds = %120
  %129 = icmp sgt i32 %126, -1
  %130 = select i1 %69, i1 %129, i1 false
  %131 = icmp slt i32 %126, %2
  %132 = select i1 %130, i1 %131, i1 false
  br i1 %132, label %133, label %137

133:                                              ; preds = %128
  %134 = sext i32 %127 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %6, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !16, !amdgpu.noclobber !14
  br label %137

137:                                              ; preds = %133, %128, %120
  %138 = phi contract float [ %136, %133 ], [ 0xFFF0000000000000, %128 ], [ 0xFFF0000000000000, %120 ]
  %139 = fcmp contract ogt float %138, %124
  %140 = select i1 %139, i32 %127, i32 %123
  %141 = select contract i1 %139, float %138, float %124
  %142 = add nuw nsw i32 %73, 4
  %143 = add i32 %74, 4
  %144 = icmp eq i32 %143, %59
  br i1 %144, label %145, label %70, !llvm.loop !20

145:                                              ; preds = %137, %61
  %146 = phi i32 [ undef, %61 ], [ %140, %137 ]
  %147 = phi float [ undef, %61 ], [ %141, %137 ]
  %148 = phi float [ %62, %61 ], [ %141, %137 ]
  %149 = phi i32 [ %63, %61 ], [ %140, %137 ]
  %150 = phi i32 [ 0, %61 ], [ %142, %137 ]
  br i1 %60, label %175, label %151

151:                                              ; preds = %145, %167
  %152 = phi float [ %171, %167 ], [ %148, %145 ]
  %153 = phi i32 [ %170, %167 ], [ %149, %145 ]
  %154 = phi i32 [ %172, %167 ], [ %150, %145 ]
  %155 = phi i32 [ %173, %167 ], [ 0, %145 ]
  %156 = add nsw i32 %154, %55
  %157 = add nsw i32 %156, %67
  br i1 %68, label %158, label %167

158:                                              ; preds = %151
  %159 = icmp sgt i32 %156, -1
  %160 = select i1 %69, i1 %159, i1 false
  %161 = icmp slt i32 %156, %2
  %162 = select i1 %160, i1 %161, i1 false
  br i1 %162, label %163, label %167

163:                                              ; preds = %158
  %164 = sext i32 %157 to i64
  %165 = getelementptr inbounds float, float addrspace(1)* %6, i64 %164
  %166 = load float, float addrspace(1)* %165, align 4, !tbaa !16, !amdgpu.noclobber !14
  br label %167

167:                                              ; preds = %163, %158, %151
  %168 = phi contract float [ %166, %163 ], [ 0xFFF0000000000000, %158 ], [ 0xFFF0000000000000, %151 ]
  %169 = fcmp contract ogt float %168, %152
  %170 = select i1 %169, i32 %157, i32 %153
  %171 = select contract i1 %169, float %168, float %152
  %172 = add nuw nsw i32 %154, 1
  %173 = add i32 %155, 1
  %174 = icmp eq i32 %173, %57
  br i1 %174, label %175, label %151, !llvm.loop !22

175:                                              ; preds = %167, %145
  %176 = phi i32 [ %146, %145 ], [ %170, %167 ]
  %177 = phi float [ %147, %145 ], [ %171, %167 ]
  %178 = add nuw nsw i32 %64, 1
  %179 = icmp eq i32 %178, %5
  br i1 %179, label %180, label %61, !llvm.loop !24

180:                                              ; preds = %175, %37
  %181 = phi i32 [ -1, %37 ], [ %176, %175 ]
  %182 = phi float [ 0xFFF0000000000000, %37 ], [ %177, %175 ]
  %183 = sext i32 %51 to i64
  %184 = getelementptr inbounds float, float addrspace(1)* %7, i64 %183
  store float %182, float addrspace(1)* %184, align 4, !tbaa !16
  %185 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %183
  store i32 %181, i32 addrspace(1)* %185, align 4, !tbaa !25
  br label %186

186:                                              ; preds = %9, %180
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
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
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
!25 = !{!26, !26, i64 0}
!26 = !{!"int", !18, i64 0}
