; ModuleID = '../data/hip_kernels/5587/59/main.cu'
source_filename = "../data/hip_kernels/5587/59/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z28forward_maxpool_layer_kerneliiiiiiiPfS_Pi(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture writeonly %8, i32 addrspace(1)* nocapture writeonly %9) local_unnamed_addr #0 {
  %11 = shl nsw i32 %6, 1
  %12 = add nsw i32 %11, %1
  %13 = sdiv i32 %12, %4
  %14 = add nsw i32 %11, %2
  %15 = sdiv i32 %14, %4
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
  br i1 %36, label %37, label %188

37:                                               ; preds = %10
  %38 = freeze i32 %35
  %39 = freeze i32 %15
  %40 = sdiv i32 %38, %39
  %41 = mul i32 %40, %39
  %42 = sub i32 %38, %41
  %43 = freeze i32 %13
  %44 = sdiv i32 %40, %43
  %45 = mul i32 %44, %43
  %46 = sub i32 %40, %45
  %47 = freeze i32 %44
  %48 = mul nsw i32 %47, %13
  %49 = add nsw i32 %48, %46
  %50 = mul nsw i32 %49, %15
  %51 = add nsw i32 %50, %42
  %52 = icmp sgt i32 %5, 0
  br i1 %52, label %53, label %182

53:                                               ; preds = %37
  %54 = mul nsw i32 %46, %4
  %55 = sub i32 %54, %6
  %56 = mul nsw i32 %42, %4
  %57 = sub i32 %56, %6
  %58 = mul nsw i32 %47, %1
  %59 = and i32 %5, 3
  %60 = icmp ult i32 %5, 4
  %61 = and i32 %5, -4
  %62 = icmp eq i32 %59, 0
  br label %63

63:                                               ; preds = %53, %177
  %64 = phi float [ 0xFFF0000000000000, %53 ], [ %179, %177 ]
  %65 = phi i32 [ -1, %53 ], [ %178, %177 ]
  %66 = phi i32 [ 0, %53 ], [ %180, %177 ]
  %67 = add nsw i32 %66, %55
  %68 = add nsw i32 %67, %58
  %69 = mul nsw i32 %68, %2
  %70 = icmp sgt i32 %67, -1
  %71 = icmp slt i32 %67, %1
  br i1 %60, label %147, label %72

72:                                               ; preds = %63, %139
  %73 = phi float [ %143, %139 ], [ %64, %63 ]
  %74 = phi i32 [ %142, %139 ], [ %65, %63 ]
  %75 = phi i32 [ %144, %139 ], [ 0, %63 ]
  %76 = phi i32 [ %145, %139 ], [ 0, %63 ]
  %77 = add nsw i32 %75, %57
  %78 = add nsw i32 %77, %69
  br i1 %70, label %79, label %88

79:                                               ; preds = %72
  %80 = icmp sgt i32 %77, -1
  %81 = select i1 %71, i1 %80, i1 false
  %82 = icmp slt i32 %77, %2
  %83 = select i1 %81, i1 %82, i1 false
  br i1 %83, label %84, label %88

84:                                               ; preds = %79
  %85 = sext i32 %78 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %7, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !16, !amdgpu.noclobber !14
  br label %88

88:                                               ; preds = %72, %79, %84
  %89 = phi contract float [ %87, %84 ], [ 0xFFF0000000000000, %79 ], [ 0xFFF0000000000000, %72 ]
  %90 = fcmp contract ogt float %89, %73
  %91 = select i1 %90, i32 %78, i32 %74
  %92 = select contract i1 %90, float %89, float %73
  %93 = or i32 %75, 1
  %94 = add nsw i32 %93, %57
  %95 = add nsw i32 %94, %69
  br i1 %70, label %96, label %105

96:                                               ; preds = %88
  %97 = icmp sgt i32 %94, -1
  %98 = select i1 %71, i1 %97, i1 false
  %99 = icmp slt i32 %94, %2
  %100 = select i1 %98, i1 %99, i1 false
  br i1 %100, label %101, label %105

101:                                              ; preds = %96
  %102 = sext i32 %95 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %7, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !16, !amdgpu.noclobber !14
  br label %105

105:                                              ; preds = %101, %96, %88
  %106 = phi contract float [ %104, %101 ], [ 0xFFF0000000000000, %96 ], [ 0xFFF0000000000000, %88 ]
  %107 = fcmp contract ogt float %106, %92
  %108 = select i1 %107, i32 %95, i32 %91
  %109 = select contract i1 %107, float %106, float %92
  %110 = or i32 %75, 2
  %111 = add nsw i32 %110, %57
  %112 = add nsw i32 %111, %69
  br i1 %70, label %113, label %122

113:                                              ; preds = %105
  %114 = icmp sgt i32 %111, -1
  %115 = select i1 %71, i1 %114, i1 false
  %116 = icmp slt i32 %111, %2
  %117 = select i1 %115, i1 %116, i1 false
  br i1 %117, label %118, label %122

118:                                              ; preds = %113
  %119 = sext i32 %112 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %7, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !16, !amdgpu.noclobber !14
  br label %122

122:                                              ; preds = %118, %113, %105
  %123 = phi contract float [ %121, %118 ], [ 0xFFF0000000000000, %113 ], [ 0xFFF0000000000000, %105 ]
  %124 = fcmp contract ogt float %123, %109
  %125 = select i1 %124, i32 %112, i32 %108
  %126 = select contract i1 %124, float %123, float %109
  %127 = or i32 %75, 3
  %128 = add nsw i32 %127, %57
  %129 = add nsw i32 %128, %69
  br i1 %70, label %130, label %139

130:                                              ; preds = %122
  %131 = icmp sgt i32 %128, -1
  %132 = select i1 %71, i1 %131, i1 false
  %133 = icmp slt i32 %128, %2
  %134 = select i1 %132, i1 %133, i1 false
  br i1 %134, label %135, label %139

135:                                              ; preds = %130
  %136 = sext i32 %129 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %7, i64 %136
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !16, !amdgpu.noclobber !14
  br label %139

139:                                              ; preds = %135, %130, %122
  %140 = phi contract float [ %138, %135 ], [ 0xFFF0000000000000, %130 ], [ 0xFFF0000000000000, %122 ]
  %141 = fcmp contract ogt float %140, %126
  %142 = select i1 %141, i32 %129, i32 %125
  %143 = select contract i1 %141, float %140, float %126
  %144 = add nuw nsw i32 %75, 4
  %145 = add i32 %76, 4
  %146 = icmp eq i32 %145, %61
  br i1 %146, label %147, label %72, !llvm.loop !20

147:                                              ; preds = %139, %63
  %148 = phi i32 [ undef, %63 ], [ %142, %139 ]
  %149 = phi float [ undef, %63 ], [ %143, %139 ]
  %150 = phi float [ %64, %63 ], [ %143, %139 ]
  %151 = phi i32 [ %65, %63 ], [ %142, %139 ]
  %152 = phi i32 [ 0, %63 ], [ %144, %139 ]
  br i1 %62, label %177, label %153

153:                                              ; preds = %147, %169
  %154 = phi float [ %173, %169 ], [ %150, %147 ]
  %155 = phi i32 [ %172, %169 ], [ %151, %147 ]
  %156 = phi i32 [ %174, %169 ], [ %152, %147 ]
  %157 = phi i32 [ %175, %169 ], [ 0, %147 ]
  %158 = add nsw i32 %156, %57
  %159 = add nsw i32 %158, %69
  br i1 %70, label %160, label %169

160:                                              ; preds = %153
  %161 = icmp sgt i32 %158, -1
  %162 = select i1 %71, i1 %161, i1 false
  %163 = icmp slt i32 %158, %2
  %164 = select i1 %162, i1 %163, i1 false
  br i1 %164, label %165, label %169

165:                                              ; preds = %160
  %166 = sext i32 %159 to i64
  %167 = getelementptr inbounds float, float addrspace(1)* %7, i64 %166
  %168 = load float, float addrspace(1)* %167, align 4, !tbaa !16, !amdgpu.noclobber !14
  br label %169

169:                                              ; preds = %165, %160, %153
  %170 = phi contract float [ %168, %165 ], [ 0xFFF0000000000000, %160 ], [ 0xFFF0000000000000, %153 ]
  %171 = fcmp contract ogt float %170, %154
  %172 = select i1 %171, i32 %159, i32 %155
  %173 = select contract i1 %171, float %170, float %154
  %174 = add nuw nsw i32 %156, 1
  %175 = add i32 %157, 1
  %176 = icmp eq i32 %175, %59
  br i1 %176, label %177, label %153, !llvm.loop !22

177:                                              ; preds = %169, %147
  %178 = phi i32 [ %148, %147 ], [ %172, %169 ]
  %179 = phi float [ %149, %147 ], [ %173, %169 ]
  %180 = add nuw nsw i32 %66, 1
  %181 = icmp eq i32 %180, %5
  br i1 %181, label %182, label %63, !llvm.loop !24

182:                                              ; preds = %177, %37
  %183 = phi i32 [ -1, %37 ], [ %178, %177 ]
  %184 = phi float [ 0xFFF0000000000000, %37 ], [ %179, %177 ]
  %185 = sext i32 %51 to i64
  %186 = getelementptr inbounds float, float addrspace(1)* %8, i64 %185
  store float %184, float addrspace(1)* %186, align 4, !tbaa !16
  %187 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %185
  store i32 %183, i32 addrspace(1)* %187, align 4, !tbaa !25
  br label %188

188:                                              ; preds = %10, %182
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
