; ModuleID = '../data/hip_kernels/1769/6/main.cu'
source_filename = "../data/hip_kernels/1769/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17wlcss_cuda_kernelPiS_S_S_S_S_S_S_S_S_S_S_(i32 addrspace(1)* nocapture writeonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture readonly %7, i32 addrspace(1)* nocapture readonly %8, i32 addrspace(1)* nocapture %9, i32 addrspace(1)* nocapture readonly %10, i32 addrspace(1)* nocapture readonly %11) local_unnamed_addr #0 {
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = sext i32 %14 to i64
  %17 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %16
  %18 = load i32, i32 addrspace(1)* %17, align 4, !tbaa !5, !amdgpu.noclobber !9
  %19 = sext i32 %15 to i64
  %20 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %19
  %21 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !5, !amdgpu.noclobber !9
  %22 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %16
  %23 = load i32, i32 addrspace(1)* %22, align 4, !tbaa !5, !amdgpu.noclobber !9
  %24 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %19
  %25 = load i32, i32 addrspace(1)* %24, align 4, !tbaa !5, !amdgpu.noclobber !9
  %26 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %27 = getelementptr inbounds i8, i8 addrspace(4)* %26, i64 12
  %28 = bitcast i8 addrspace(4)* %27 to i32 addrspace(4)*
  %29 = load i32, i32 addrspace(4)* %28, align 4, !tbaa !10
  %30 = getelementptr i8, i8 addrspace(4)* %26, i64 4
  %31 = bitcast i8 addrspace(4)* %30 to i16 addrspace(4)*
  %32 = load i16, i16 addrspace(4)* %31, align 4, !range !19, !invariant.load !9
  %33 = zext i16 %32 to i32
  %34 = udiv i32 %29, %33
  %35 = mul i32 %34, %33
  %36 = icmp ugt i32 %29, %35
  %37 = zext i1 %36 to i32
  %38 = add i32 %34, %37
  %39 = mul i32 %38, %13
  %40 = getelementptr inbounds i8, i8 addrspace(4)* %26, i64 16
  %41 = bitcast i8 addrspace(4)* %40 to i32 addrspace(4)*
  %42 = load i32, i32 addrspace(4)* %41, align 8, !tbaa !20
  %43 = getelementptr i8, i8 addrspace(4)* %26, i64 6
  %44 = bitcast i8 addrspace(4)* %43 to i16 addrspace(4)*
  %45 = load i16, i16 addrspace(4)* %44, align 2, !range !19, !invariant.load !9
  %46 = zext i16 %45 to i32
  %47 = udiv i32 %42, %46
  %48 = mul i32 %47, %46
  %49 = icmp ugt i32 %42, %48
  %50 = zext i1 %49 to i32
  %51 = add i32 %47, %50
  %52 = add i32 %39, %14
  %53 = mul i32 %51, %52
  %54 = add i32 %53, %15
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %55
  %57 = load i32, i32 addrspace(1)* %56, align 4, !tbaa !5, !amdgpu.noclobber !9
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %55
  %59 = load i32, i32 addrspace(1)* %58, align 4, !tbaa !5, !amdgpu.noclobber !9
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %60
  %62 = sext i32 %57 to i64
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %62
  %64 = sext i32 %23 to i64
  %65 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %64
  %66 = sext i32 %25 to i64
  %67 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %66
  %68 = mul nuw nsw i32 %13, 3
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %69
  %71 = load i32, i32 addrspace(1)* %70, align 4, !tbaa !5, !amdgpu.noclobber !9
  %72 = add nuw nsw i32 %68, 1
  %73 = zext i32 %72 to i64
  %74 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %73
  %75 = load i32, i32 addrspace(1)* %74, align 4, !tbaa !5, !amdgpu.noclobber !9
  %76 = add nuw nsw i32 %68, 2
  %77 = zext i32 %76 to i64
  %78 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %77
  %79 = load i32, i32 addrspace(1)* %78, align 4, !tbaa !5, !amdgpu.noclobber !9
  %80 = icmp sgt i32 %21, 0
  br i1 %80, label %81, label %100

81:                                               ; preds = %12
  %82 = icmp sgt i32 %18, 0
  %83 = add nsw i32 %18, 1
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds i32, i32 addrspace(1)* %61, i64 %84
  %86 = sext i32 %18 to i64
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %61, i64 %86
  %88 = and i32 %18, 1
  %89 = icmp eq i32 %18, 1
  %90 = and i32 %18, -2
  %91 = icmp eq i32 %88, 0
  br label %92

92:                                               ; preds = %81, %136
  %93 = phi i32 [ 0, %81 ], [ %140, %136 ]
  br i1 %82, label %97, label %94

94:                                               ; preds = %92
  %95 = load i32, i32 addrspace(1)* %85, align 4, !tbaa !5
  %96 = zext i32 %93 to i64
  br label %136

97:                                               ; preds = %92
  %98 = zext i32 %93 to i64
  %99 = getelementptr inbounds i32, i32 addrspace(1)* %67, i64 %98
  br i1 %89, label %101, label %142

100:                                              ; preds = %136, %12
  ret void

101:                                              ; preds = %203, %97
  %102 = phi i32 [ undef, %97 ], [ %205, %203 ]
  %103 = phi i32 [ 0, %97 ], [ %188, %203 ]
  br i1 %91, label %136, label %104

104:                                              ; preds = %101
  %105 = load i32, i32 addrspace(1)* %99, align 4, !tbaa !5
  %106 = mul nsw i32 %105, 26
  %107 = zext i32 %103 to i64
  %108 = getelementptr inbounds i32, i32 addrspace(1)* %65, i64 %107
  %109 = load i32, i32 addrspace(1)* %108, align 4, !tbaa !5
  %110 = add nsw i32 %106, %109
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %111
  %113 = load i32, i32 addrspace(1)* %112, align 4, !tbaa !5
  %114 = icmp sgt i32 %113, %79
  %115 = getelementptr inbounds i32, i32 addrspace(1)* %61, i64 %107
  %116 = load i32, i32 addrspace(1)* %115, align 4, !tbaa !5
  br i1 %114, label %120, label %117

117:                                              ; preds = %104
  %118 = add nsw i32 %116, %71
  %119 = load i32, i32 addrspace(1)* %85, align 4, !tbaa !5
  br label %132

120:                                              ; preds = %104
  %121 = add nuw nsw i32 %103, 1
  %122 = mul nsw i32 %113, %75
  %123 = sub nsw i32 %116, %122
  %124 = zext i32 %121 to i64
  %125 = getelementptr inbounds i32, i32 addrspace(1)* %61, i64 %124
  %126 = load i32, i32 addrspace(1)* %125, align 4, !tbaa !5
  %127 = sub nsw i32 %126, %122
  %128 = load i32, i32 addrspace(1)* %85, align 4, !tbaa !5
  %129 = sub nsw i32 %128, %122
  %130 = tail call i32 @llvm.smax.i32(i32 %127, i32 %129)
  %131 = tail call i32 @llvm.smax.i32(i32 %123, i32 %130)
  br label %132

132:                                              ; preds = %120, %117
  %133 = phi i32 [ %128, %120 ], [ %119, %117 ]
  %134 = phi i32 [ %131, %120 ], [ %118, %117 ]
  %135 = getelementptr inbounds i32, i32 addrspace(1)* %61, i64 %107
  store i32 %133, i32 addrspace(1)* %135, align 4, !tbaa !5
  store i32 %134, i32 addrspace(1)* %85, align 4, !tbaa !5
  br label %136

136:                                              ; preds = %132, %101, %94
  %137 = phi i64 [ %96, %94 ], [ %98, %101 ], [ %98, %132 ]
  %138 = phi i32 [ %95, %94 ], [ %102, %101 ], [ %134, %132 ]
  store i32 %138, i32 addrspace(1)* %87, align 4, !tbaa !5
  %139 = getelementptr inbounds i32, i32 addrspace(1)* %63, i64 %137
  store i32 %138, i32 addrspace(1)* %139, align 4, !tbaa !5
  store i32 0, i32 addrspace(1)* %85, align 4, !tbaa !5
  %140 = add nuw nsw i32 %93, 1
  %141 = icmp eq i32 %140, %21
  br i1 %141, label %100, label %92, !llvm.loop !21

142:                                              ; preds = %97, %203
  %143 = phi i32 [ %188, %203 ], [ 0, %97 ]
  %144 = phi i32 [ %207, %203 ], [ 0, %97 ]
  %145 = load i32, i32 addrspace(1)* %99, align 4, !tbaa !5
  %146 = mul nsw i32 %145, 26
  %147 = zext i32 %143 to i64
  %148 = getelementptr inbounds i32, i32 addrspace(1)* %65, i64 %147
  %149 = load i32, i32 addrspace(1)* %148, align 4, !tbaa !5
  %150 = add nsw i32 %146, %149
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %151
  %153 = load i32, i32 addrspace(1)* %152, align 4, !tbaa !5
  %154 = icmp sgt i32 %153, %79
  %155 = getelementptr inbounds i32, i32 addrspace(1)* %61, i64 %147
  %156 = load i32, i32 addrspace(1)* %155, align 4, !tbaa !5
  %157 = or i32 %143, 1
  br i1 %154, label %161, label %158

158:                                              ; preds = %142
  %159 = add nsw i32 %156, %71
  %160 = load i32, i32 addrspace(1)* %85, align 4, !tbaa !5
  br label %172

161:                                              ; preds = %142
  %162 = mul nsw i32 %153, %75
  %163 = sub nsw i32 %156, %162
  %164 = zext i32 %157 to i64
  %165 = getelementptr inbounds i32, i32 addrspace(1)* %61, i64 %164
  %166 = load i32, i32 addrspace(1)* %165, align 4, !tbaa !5
  %167 = sub nsw i32 %166, %162
  %168 = load i32, i32 addrspace(1)* %85, align 4, !tbaa !5
  %169 = sub nsw i32 %168, %162
  %170 = tail call i32 @llvm.smax.i32(i32 %167, i32 %169)
  %171 = tail call i32 @llvm.smax.i32(i32 %163, i32 %170)
  br label %172

172:                                              ; preds = %161, %158
  %173 = phi i32 [ %168, %161 ], [ %160, %158 ]
  %174 = phi i32 [ %171, %161 ], [ %159, %158 ]
  %175 = getelementptr inbounds i32, i32 addrspace(1)* %61, i64 %147
  store i32 %173, i32 addrspace(1)* %175, align 4, !tbaa !5
  store i32 %174, i32 addrspace(1)* %85, align 4, !tbaa !5
  %176 = load i32, i32 addrspace(1)* %99, align 4, !tbaa !5
  %177 = mul nsw i32 %176, 26
  %178 = zext i32 %157 to i64
  %179 = getelementptr inbounds i32, i32 addrspace(1)* %65, i64 %178
  %180 = load i32, i32 addrspace(1)* %179, align 4, !tbaa !5
  %181 = add nsw i32 %177, %180
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %182
  %184 = load i32, i32 addrspace(1)* %183, align 4, !tbaa !5
  %185 = icmp sgt i32 %184, %79
  %186 = getelementptr inbounds i32, i32 addrspace(1)* %61, i64 %178
  %187 = load i32, i32 addrspace(1)* %186, align 4, !tbaa !5
  %188 = add nuw nsw i32 %143, 2
  br i1 %185, label %192, label %189

189:                                              ; preds = %172
  %190 = add nsw i32 %187, %71
  %191 = load i32, i32 addrspace(1)* %85, align 4, !tbaa !5
  br label %203

192:                                              ; preds = %172
  %193 = mul nsw i32 %184, %75
  %194 = sub nsw i32 %187, %193
  %195 = zext i32 %188 to i64
  %196 = getelementptr inbounds i32, i32 addrspace(1)* %61, i64 %195
  %197 = load i32, i32 addrspace(1)* %196, align 4, !tbaa !5
  %198 = sub nsw i32 %197, %193
  %199 = load i32, i32 addrspace(1)* %85, align 4, !tbaa !5
  %200 = sub nsw i32 %199, %193
  %201 = tail call i32 @llvm.smax.i32(i32 %198, i32 %200)
  %202 = tail call i32 @llvm.smax.i32(i32 %194, i32 %201)
  br label %203

203:                                              ; preds = %192, %189
  %204 = phi i32 [ %199, %192 ], [ %191, %189 ]
  %205 = phi i32 [ %202, %192 ], [ %190, %189 ]
  %206 = getelementptr inbounds i32, i32 addrspace(1)* %61, i64 %178
  store i32 %204, i32 addrspace(1)* %206, align 4, !tbaa !5
  store i32 %205, i32 addrspace(1)* %85, align 4, !tbaa !5
  %207 = add i32 %144, 2
  %208 = icmp eq i32 %207, %90
  br i1 %208, label %101, label %142, !llvm.loop !23
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{!11, !15, i64 12}
!11 = !{!"hsa_kernel_dispatch_packet_s", !12, i64 0, !12, i64 2, !12, i64 4, !12, i64 6, !12, i64 8, !12, i64 10, !15, i64 12, !15, i64 16, !15, i64 20, !15, i64 24, !15, i64 28, !16, i64 32, !17, i64 40, !16, i64 48, !18, i64 56}
!12 = !{!"short", !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C/C++ TBAA"}
!15 = !{!"int", !13, i64 0}
!16 = !{!"long", !13, i64 0}
!17 = !{!"any pointer", !13, i64 0}
!18 = !{!"hsa_signal_s", !16, i64 0}
!19 = !{i16 1, i16 1025}
!20 = !{!11, !15, i64 16}
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.mustprogress"}
!23 = distinct !{!23, !22}
