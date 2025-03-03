; ModuleID = '../data/hip_kernels/8789/37/main.cu'
source_filename = "../data/hip_kernels/8789/37/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z28forward_maxpool_layer_kerneliiiiiiPfS_Pi(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture writeonly %7, i32 addrspace(1)* nocapture writeonly %8) local_unnamed_addr #0 {
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
  br i1 %36, label %37, label %191

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
  %48 = xor i32 %5, -1
  %49 = sdiv i32 %48, 2
  %50 = add nsw i32 %49, 1
  %51 = mul nsw i32 %47, %12
  %52 = add nsw i32 %51, %46
  %53 = mul nsw i32 %52, %15
  %54 = add nsw i32 %53, %42
  %55 = icmp sgt i32 %5, 0
  br i1 %55, label %56, label %185

56:                                               ; preds = %37
  %57 = mul nsw i32 %46, %4
  %58 = add nsw i32 %57, %50
  %59 = mul nsw i32 %42, %4
  %60 = add nsw i32 %59, %50
  %61 = mul nsw i32 %47, %1
  %62 = and i32 %5, 3
  %63 = icmp ult i32 %5, 4
  %64 = and i32 %5, -4
  %65 = icmp eq i32 %62, 0
  br label %66

66:                                               ; preds = %56, %180
  %67 = phi float [ 0xFFF0000000000000, %56 ], [ %182, %180 ]
  %68 = phi i32 [ -1, %56 ], [ %181, %180 ]
  %69 = phi i32 [ 0, %56 ], [ %183, %180 ]
  %70 = add nsw i32 %58, %69
  %71 = add nsw i32 %70, %61
  %72 = mul nsw i32 %71, %2
  %73 = icmp sgt i32 %70, -1
  %74 = icmp slt i32 %70, %1
  br i1 %63, label %150, label %75

75:                                               ; preds = %66, %142
  %76 = phi float [ %146, %142 ], [ %67, %66 ]
  %77 = phi i32 [ %145, %142 ], [ %68, %66 ]
  %78 = phi i32 [ %147, %142 ], [ 0, %66 ]
  %79 = phi i32 [ %148, %142 ], [ 0, %66 ]
  %80 = add nsw i32 %60, %78
  %81 = add nsw i32 %80, %72
  br i1 %73, label %82, label %91

82:                                               ; preds = %75
  %83 = icmp sgt i32 %80, -1
  %84 = select i1 %74, i1 %83, i1 false
  %85 = icmp slt i32 %80, %2
  %86 = select i1 %84, i1 %85, i1 false
  br i1 %86, label %87, label %91

87:                                               ; preds = %82
  %88 = sext i32 %81 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %6, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !16, !amdgpu.noclobber !14
  br label %91

91:                                               ; preds = %75, %82, %87
  %92 = phi contract float [ %90, %87 ], [ 0xFFF0000000000000, %82 ], [ 0xFFF0000000000000, %75 ]
  %93 = fcmp contract ogt float %92, %76
  %94 = select i1 %93, i32 %81, i32 %77
  %95 = select contract i1 %93, float %92, float %76
  %96 = or i32 %78, 1
  %97 = add nsw i32 %60, %96
  %98 = add nsw i32 %97, %72
  br i1 %73, label %99, label %108

99:                                               ; preds = %91
  %100 = icmp sgt i32 %97, -1
  %101 = select i1 %74, i1 %100, i1 false
  %102 = icmp slt i32 %97, %2
  %103 = select i1 %101, i1 %102, i1 false
  br i1 %103, label %104, label %108

104:                                              ; preds = %99
  %105 = sext i32 %98 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %6, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !16, !amdgpu.noclobber !14
  br label %108

108:                                              ; preds = %104, %99, %91
  %109 = phi contract float [ %107, %104 ], [ 0xFFF0000000000000, %99 ], [ 0xFFF0000000000000, %91 ]
  %110 = fcmp contract ogt float %109, %95
  %111 = select i1 %110, i32 %98, i32 %94
  %112 = select contract i1 %110, float %109, float %95
  %113 = or i32 %78, 2
  %114 = add nsw i32 %60, %113
  %115 = add nsw i32 %114, %72
  br i1 %73, label %116, label %125

116:                                              ; preds = %108
  %117 = icmp sgt i32 %114, -1
  %118 = select i1 %74, i1 %117, i1 false
  %119 = icmp slt i32 %114, %2
  %120 = select i1 %118, i1 %119, i1 false
  br i1 %120, label %121, label %125

121:                                              ; preds = %116
  %122 = sext i32 %115 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %6, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !16, !amdgpu.noclobber !14
  br label %125

125:                                              ; preds = %121, %116, %108
  %126 = phi contract float [ %124, %121 ], [ 0xFFF0000000000000, %116 ], [ 0xFFF0000000000000, %108 ]
  %127 = fcmp contract ogt float %126, %112
  %128 = select i1 %127, i32 %115, i32 %111
  %129 = select contract i1 %127, float %126, float %112
  %130 = or i32 %78, 3
  %131 = add nsw i32 %60, %130
  %132 = add nsw i32 %131, %72
  br i1 %73, label %133, label %142

133:                                              ; preds = %125
  %134 = icmp sgt i32 %131, -1
  %135 = select i1 %74, i1 %134, i1 false
  %136 = icmp slt i32 %131, %2
  %137 = select i1 %135, i1 %136, i1 false
  br i1 %137, label %138, label %142

138:                                              ; preds = %133
  %139 = sext i32 %132 to i64
  %140 = getelementptr inbounds float, float addrspace(1)* %6, i64 %139
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !16, !amdgpu.noclobber !14
  br label %142

142:                                              ; preds = %138, %133, %125
  %143 = phi contract float [ %141, %138 ], [ 0xFFF0000000000000, %133 ], [ 0xFFF0000000000000, %125 ]
  %144 = fcmp contract ogt float %143, %129
  %145 = select i1 %144, i32 %132, i32 %128
  %146 = select contract i1 %144, float %143, float %129
  %147 = add nuw nsw i32 %78, 4
  %148 = add i32 %79, 4
  %149 = icmp eq i32 %148, %64
  br i1 %149, label %150, label %75, !llvm.loop !20

150:                                              ; preds = %142, %66
  %151 = phi i32 [ undef, %66 ], [ %145, %142 ]
  %152 = phi float [ undef, %66 ], [ %146, %142 ]
  %153 = phi float [ %67, %66 ], [ %146, %142 ]
  %154 = phi i32 [ %68, %66 ], [ %145, %142 ]
  %155 = phi i32 [ 0, %66 ], [ %147, %142 ]
  br i1 %65, label %180, label %156

156:                                              ; preds = %150, %172
  %157 = phi float [ %176, %172 ], [ %153, %150 ]
  %158 = phi i32 [ %175, %172 ], [ %154, %150 ]
  %159 = phi i32 [ %177, %172 ], [ %155, %150 ]
  %160 = phi i32 [ %178, %172 ], [ 0, %150 ]
  %161 = add nsw i32 %60, %159
  %162 = add nsw i32 %161, %72
  br i1 %73, label %163, label %172

163:                                              ; preds = %156
  %164 = icmp sgt i32 %161, -1
  %165 = select i1 %74, i1 %164, i1 false
  %166 = icmp slt i32 %161, %2
  %167 = select i1 %165, i1 %166, i1 false
  br i1 %167, label %168, label %172

168:                                              ; preds = %163
  %169 = sext i32 %162 to i64
  %170 = getelementptr inbounds float, float addrspace(1)* %6, i64 %169
  %171 = load float, float addrspace(1)* %170, align 4, !tbaa !16, !amdgpu.noclobber !14
  br label %172

172:                                              ; preds = %168, %163, %156
  %173 = phi contract float [ %171, %168 ], [ 0xFFF0000000000000, %163 ], [ 0xFFF0000000000000, %156 ]
  %174 = fcmp contract ogt float %173, %157
  %175 = select i1 %174, i32 %162, i32 %158
  %176 = select contract i1 %174, float %173, float %157
  %177 = add nuw nsw i32 %159, 1
  %178 = add i32 %160, 1
  %179 = icmp eq i32 %178, %62
  br i1 %179, label %180, label %156, !llvm.loop !22

180:                                              ; preds = %172, %150
  %181 = phi i32 [ %151, %150 ], [ %175, %172 ]
  %182 = phi float [ %152, %150 ], [ %176, %172 ]
  %183 = add nuw nsw i32 %69, 1
  %184 = icmp eq i32 %183, %5
  br i1 %184, label %185, label %66, !llvm.loop !24

185:                                              ; preds = %180, %37
  %186 = phi i32 [ -1, %37 ], [ %181, %180 ]
  %187 = phi float [ 0xFFF0000000000000, %37 ], [ %182, %180 ]
  %188 = sext i32 %54 to i64
  %189 = getelementptr inbounds float, float addrspace(1)* %7, i64 %188
  store float %187, float addrspace(1)* %189, align 4, !tbaa !16
  %190 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %188
  store i32 %186, i32 addrspace(1)* %190, align 4, !tbaa !25
  br label %191

191:                                              ; preds = %9, %185
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
