; ModuleID = '../data/hip_kernels/249/3/main.cu'
source_filename = "../data/hip_kernels/249/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z24THCudaTensor_kernel_copyPfPlS0_iS_S0_S0_ill(float addrspace(1)* nocapture writeonly %0, i64 addrspace(1)* nocapture readonly %1, i64 addrspace(1)* nocapture readonly %2, i32 %3, float addrspace(1)* nocapture readonly %4, i64 addrspace(1)* nocapture readonly %5, i64 addrspace(1)* nocapture readonly %6, i32 %7, i64 %8, i64 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 12
  %14 = bitcast i8 addrspace(4)* %13 to i32 addrspace(4)*
  %15 = load i32, i32 addrspace(4)* %14, align 4, !tbaa !4
  %16 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !13, !invariant.load !14
  %19 = zext i16 %18 to i32
  %20 = udiv i32 %15, %19
  %21 = mul i32 %20, %19
  %22 = icmp ugt i32 %15, %21
  %23 = zext i1 %22 to i32
  %24 = add i32 %20, %23
  %25 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 16
  %26 = bitcast i8 addrspace(4)* %25 to i32 addrspace(4)*
  %27 = load i32, i32 addrspace(4)* %26, align 8, !tbaa !15
  %28 = getelementptr i8, i8 addrspace(4)* %12, i64 6
  %29 = bitcast i8 addrspace(4)* %28 to i16 addrspace(4)*
  %30 = load i16, i16 addrspace(4)* %29, align 2, !range !13, !invariant.load !14
  %31 = zext i16 %30 to i32
  %32 = udiv i32 %27, %31
  %33 = mul i32 %32, %31
  %34 = icmp ugt i32 %27, %33
  %35 = zext i1 %34 to i32
  %36 = add i32 %32, %35
  %37 = mul i32 %36, %11
  %38 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %39 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %40 = add i32 %37, %38
  %41 = mul i32 %40, %24
  %42 = add i32 %41, %39
  %43 = mul i32 %42, %31
  %44 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !16
  %45 = add i32 %43, %44
  %46 = zext i32 %45 to i64
  %47 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !16
  %48 = add nsw i32 %7, -1
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i64, i64 addrspace(1)* %6, i64 %49
  %51 = load i64, i64 addrspace(1)* %50, align 8, !tbaa !17, !amdgpu.noclobber !14
  %52 = add nsw i32 %3, -1
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i64, i64 addrspace(1)* %2, i64 %53
  %55 = load i64, i64 addrspace(1)* %54, align 8, !tbaa !17, !amdgpu.noclobber !14
  %56 = mul nsw i64 %55, %9
  %57 = add nuw nsw i64 %46, 1
  %58 = mul nsw i64 %57, %9
  %59 = icmp sgt i64 %58, %8
  br i1 %59, label %197, label %60

60:                                               ; preds = %10
  %61 = mul nsw i64 %46, %9
  %62 = icmp sgt i32 %3, 0
  br i1 %62, label %63, label %84

63:                                               ; preds = %60
  %64 = and i32 %3, 1
  %65 = icmp eq i32 %52, 0
  br i1 %65, label %70, label %66

66:                                               ; preds = %63
  %67 = and i32 %3, -2
  br label %92

68:                                               ; preds = %92
  %69 = zext i32 %121 to i64
  br label %70

70:                                               ; preds = %68, %63
  %71 = phi i64 [ undef, %63 ], [ %118, %68 ]
  %72 = phi i64 [ 0, %63 ], [ %69, %68 ]
  %73 = phi i64 [ %61, %63 ], [ %120, %68 ]
  %74 = phi i64 [ 0, %63 ], [ %118, %68 ]
  %75 = icmp eq i32 %64, 0
  br i1 %75, label %84, label %76

76:                                               ; preds = %70
  %77 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %72
  %78 = load i64, i64 addrspace(1)* %77, align 8, !tbaa !17, !amdgpu.noclobber !14
  %79 = sdiv i64 %73, %78
  %80 = getelementptr inbounds i64, i64 addrspace(1)* %2, i64 %72
  %81 = load i64, i64 addrspace(1)* %80, align 8, !tbaa !17, !amdgpu.noclobber !14
  %82 = mul nsw i64 %81, %79
  %83 = add nsw i64 %82, %74
  br label %84

84:                                               ; preds = %76, %70, %60
  %85 = phi i64 [ 0, %60 ], [ %71, %70 ], [ %83, %76 ]
  %86 = icmp sgt i32 %7, 0
  br i1 %86, label %87, label %140

87:                                               ; preds = %84
  %88 = and i32 %7, 1
  %89 = icmp eq i32 %7, 1
  br i1 %89, label %126, label %90

90:                                               ; preds = %87
  %91 = and i32 %7, -2
  br label %151

92:                                               ; preds = %92, %66
  %93 = phi i32 [ 0, %66 ], [ %121, %92 ]
  %94 = phi i64 [ %61, %66 ], [ %120, %92 ]
  %95 = phi i64 [ 0, %66 ], [ %118, %92 ]
  %96 = phi i32 [ 0, %66 ], [ %122, %92 ]
  %97 = zext i32 %93 to i64
  %98 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %97
  %99 = load i64, i64 addrspace(1)* %98, align 8, !tbaa !17, !amdgpu.noclobber !14
  %100 = freeze i64 %94
  %101 = freeze i64 %99
  %102 = sdiv i64 %100, %101
  %103 = getelementptr inbounds i64, i64 addrspace(1)* %2, i64 %97
  %104 = load i64, i64 addrspace(1)* %103, align 8, !tbaa !17, !amdgpu.noclobber !14
  %105 = mul nsw i64 %104, %102
  %106 = add nsw i64 %105, %95
  %107 = mul i64 %102, %101
  %108 = sub i64 %100, %107
  %109 = or i32 %93, 1
  %110 = zext i32 %109 to i64
  %111 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %110
  %112 = load i64, i64 addrspace(1)* %111, align 8, !tbaa !17, !amdgpu.noclobber !14
  %113 = freeze i64 %112
  %114 = sdiv i64 %108, %113
  %115 = getelementptr inbounds i64, i64 addrspace(1)* %2, i64 %110
  %116 = load i64, i64 addrspace(1)* %115, align 8, !tbaa !17, !amdgpu.noclobber !14
  %117 = mul nsw i64 %116, %114
  %118 = add nsw i64 %117, %106
  %119 = mul i64 %114, %113
  %120 = sub i64 %108, %119
  %121 = add nuw nsw i32 %93, 2
  %122 = add i32 %96, 2
  %123 = icmp eq i32 %122, %67
  br i1 %123, label %68, label %92, !llvm.loop !21

124:                                              ; preds = %151
  %125 = zext i32 %180 to i64
  br label %126

126:                                              ; preds = %124, %87
  %127 = phi i64 [ undef, %87 ], [ %177, %124 ]
  %128 = phi i64 [ 0, %87 ], [ %125, %124 ]
  %129 = phi i64 [ %61, %87 ], [ %179, %124 ]
  %130 = phi i64 [ 0, %87 ], [ %177, %124 ]
  %131 = icmp eq i32 %88, 0
  br i1 %131, label %140, label %132

132:                                              ; preds = %126
  %133 = getelementptr inbounds i64, i64 addrspace(1)* %5, i64 %128
  %134 = load i64, i64 addrspace(1)* %133, align 8, !tbaa !17, !amdgpu.noclobber !14
  %135 = sdiv i64 %129, %134
  %136 = getelementptr inbounds i64, i64 addrspace(1)* %6, i64 %128
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !17, !amdgpu.noclobber !14
  %138 = mul nsw i64 %137, %135
  %139 = add nsw i64 %138, %130
  br label %140

140:                                              ; preds = %132, %126, %84
  %141 = phi i64 [ 0, %84 ], [ %127, %126 ], [ %139, %132 ]
  %142 = trunc i64 %51 to i32
  %143 = trunc i64 %55 to i32
  %144 = mul i32 %47, %143
  %145 = sext i32 %144 to i64
  %146 = icmp sgt i64 %56, %145
  br i1 %146, label %147, label %197

147:                                              ; preds = %140
  %148 = mul i32 %47, %142
  %149 = mul i32 %142, %19
  %150 = mul i32 %143, %19
  br label %183

151:                                              ; preds = %151, %90
  %152 = phi i32 [ 0, %90 ], [ %180, %151 ]
  %153 = phi i64 [ %61, %90 ], [ %179, %151 ]
  %154 = phi i64 [ 0, %90 ], [ %177, %151 ]
  %155 = phi i32 [ 0, %90 ], [ %181, %151 ]
  %156 = zext i32 %152 to i64
  %157 = getelementptr inbounds i64, i64 addrspace(1)* %5, i64 %156
  %158 = load i64, i64 addrspace(1)* %157, align 8, !tbaa !17, !amdgpu.noclobber !14
  %159 = freeze i64 %153
  %160 = freeze i64 %158
  %161 = sdiv i64 %159, %160
  %162 = getelementptr inbounds i64, i64 addrspace(1)* %6, i64 %156
  %163 = load i64, i64 addrspace(1)* %162, align 8, !tbaa !17, !amdgpu.noclobber !14
  %164 = mul nsw i64 %163, %161
  %165 = add nsw i64 %164, %154
  %166 = mul i64 %161, %160
  %167 = sub i64 %159, %166
  %168 = or i32 %152, 1
  %169 = zext i32 %168 to i64
  %170 = getelementptr inbounds i64, i64 addrspace(1)* %5, i64 %169
  %171 = load i64, i64 addrspace(1)* %170, align 8, !tbaa !17, !amdgpu.noclobber !14
  %172 = freeze i64 %171
  %173 = sdiv i64 %167, %172
  %174 = getelementptr inbounds i64, i64 addrspace(1)* %6, i64 %169
  %175 = load i64, i64 addrspace(1)* %174, align 8, !tbaa !17, !amdgpu.noclobber !14
  %176 = mul nsw i64 %175, %173
  %177 = add nsw i64 %176, %165
  %178 = mul i64 %173, %172
  %179 = sub i64 %167, %178
  %180 = add nuw nsw i32 %152, 2
  %181 = add i32 %155, 2
  %182 = icmp eq i32 %181, %91
  br i1 %182, label %124, label %151, !llvm.loop !23

183:                                              ; preds = %147, %183
  %184 = phi i64 [ %145, %147 ], [ %195, %183 ]
  %185 = phi i32 [ %148, %147 ], [ %193, %183 ]
  %186 = trunc i64 %184 to i32
  %187 = sext i32 %185 to i64
  %188 = add nsw i64 %141, %187
  %189 = getelementptr inbounds float, float addrspace(1)* %4, i64 %188
  %190 = load float, float addrspace(1)* %189, align 4, !tbaa !24
  %191 = add nsw i64 %184, %85
  %192 = getelementptr inbounds float, float addrspace(1)* %0, i64 %191
  store float %190, float addrspace(1)* %192, align 4, !tbaa !24
  %193 = add i32 %185, %149
  %194 = add i32 %150, %186
  %195 = sext i32 %194 to i64
  %196 = icmp sgt i64 %56, %195
  br i1 %196, label %183, label %197, !llvm.loop !26

197:                                              ; preds = %183, %140, %10
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #1

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
!15 = !{!5, !9, i64 16}
!16 = !{i32 0, i32 1024}
!17 = !{!18, !18, i64 0}
!18 = !{!"long", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.mustprogress"}
!23 = distinct !{!23, !22}
!24 = !{!25, !25, i64 0}
!25 = !{!"float", !19, i64 0}
!26 = distinct !{!26, !22}
