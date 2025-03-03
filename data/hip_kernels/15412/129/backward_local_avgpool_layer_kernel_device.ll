; ModuleID = '../data/hip_kernels/15412/129/main.cu'
source_filename = "../data/hip_kernels/15412/129/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z35backward_local_avgpool_layer_kerneliiiiiiiiPfS_(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, float addrspace(1)* nocapture readonly %8, float addrspace(1)* nocapture %9) local_unnamed_addr #0 {
  %11 = sub i32 %1, %6
  %12 = add i32 %11, %7
  %13 = sdiv i32 %12, %5
  %14 = add nsw i32 %13, 1
  %15 = sub i32 %2, %6
  %16 = add i32 %15, %7
  %17 = sdiv i32 %16, %4
  %18 = add nsw i32 %17, 1
  %19 = add nsw i32 %6, -1
  %20 = sdiv i32 %19, %4
  %21 = sdiv i32 %19, %5
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %23 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %24 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %25 = getelementptr inbounds i8, i8 addrspace(4)* %24, i64 12
  %26 = bitcast i8 addrspace(4)* %25 to i32 addrspace(4)*
  %27 = load i32, i32 addrspace(4)* %26, align 4, !tbaa !4
  %28 = getelementptr i8, i8 addrspace(4)* %24, i64 4
  %29 = bitcast i8 addrspace(4)* %28 to i16 addrspace(4)*
  %30 = load i16, i16 addrspace(4)* %29, align 4, !range !13, !invariant.load !14
  %31 = zext i16 %30 to i32
  %32 = udiv i32 %27, %31
  %33 = mul i32 %32, %31
  %34 = icmp ugt i32 %27, %33
  %35 = zext i1 %34 to i32
  %36 = add i32 %32, %35
  %37 = mul i32 %36, %23
  %38 = add i32 %37, %22
  %39 = mul i32 %38, %31
  %40 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %41 = add i32 %39, %40
  %42 = icmp slt i32 %41, %0
  br i1 %42, label %43, label %201

43:                                               ; preds = %10
  %44 = freeze i32 %41
  %45 = freeze i32 %2
  %46 = sdiv i32 %44, %45
  %47 = sdiv i32 %7, -2
  %48 = icmp slt i32 %21, 0
  br i1 %48, label %190, label %49

49:                                               ; preds = %43
  %50 = sub nsw i32 0, %21
  %51 = freeze i32 %46
  %52 = freeze i32 %1
  %53 = sdiv i32 %51, %52
  %54 = freeze i32 %53
  %55 = mul i32 %53, %52
  %56 = sub i32 %51, %55
  %57 = mul i32 %46, %45
  %58 = sub i32 %44, %57
  %59 = sub i32 0, %20
  %60 = icmp slt i32 %20, 0
  %61 = sub nsw i32 %58, %47
  %62 = sub nsw i32 %56, %47
  %63 = mul nsw i32 %54, %14
  %64 = tail call i32 @llvm.abs.i32(i32 %20, i1 false)
  %65 = add i32 %20, %64
  %66 = add i32 %65, 1
  %67 = and i32 %66, 3
  %68 = icmp eq i32 %67, 0
  %69 = icmp ult i32 %65, 3
  br label %70

70:                                               ; preds = %49, %185
  %71 = phi i32 [ 0, %49 ], [ %187, %185 ]
  %72 = phi float [ 0.000000e+00, %49 ], [ %186, %185 ]
  %73 = phi i32 [ %50, %49 ], [ %188, %185 ]
  br i1 %60, label %185, label %74

74:                                               ; preds = %70
  %75 = sdiv i32 %61, %4
  %76 = sdiv i32 %62, %5
  %77 = add nsw i32 %76, %73
  %78 = add nsw i32 %77, %63
  %79 = mul nsw i32 %78, %18
  %80 = icmp sgt i32 %77, -1
  %81 = icmp sle i32 %77, %13
  br i1 %68, label %106, label %82

82:                                               ; preds = %74, %100
  %83 = phi i32 [ %102, %100 ], [ %71, %74 ]
  %84 = phi float [ %101, %100 ], [ %72, %74 ]
  %85 = phi i32 [ %103, %100 ], [ %59, %74 ]
  %86 = phi i32 [ %104, %100 ], [ 0, %74 ]
  %87 = add nsw i32 %75, %85
  %88 = add nsw i32 %79, %87
  %89 = icmp sgt i32 %87, -1
  br i1 %89, label %90, label %100

90:                                               ; preds = %82
  %91 = icmp sle i32 %87, %17
  %92 = select i1 %91, i1 %80, i1 false
  %93 = select i1 %92, i1 %81, i1 false
  br i1 %93, label %94, label %100

94:                                               ; preds = %90
  %95 = add nsw i32 %83, 1
  %96 = sext i32 %88 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %8, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !16, !amdgpu.noclobber !14
  %99 = fadd contract float %84, %98
  br label %100

100:                                              ; preds = %94, %90, %82
  %101 = phi float [ %99, %94 ], [ %84, %90 ], [ %84, %82 ]
  %102 = phi i32 [ %95, %94 ], [ %83, %90 ], [ %83, %82 ]
  %103 = add i32 %85, 1
  %104 = add i32 %86, 1
  %105 = icmp eq i32 %104, %67
  br i1 %105, label %106, label %82, !llvm.loop !20

106:                                              ; preds = %100, %74
  %107 = phi float [ undef, %74 ], [ %101, %100 ]
  %108 = phi i32 [ undef, %74 ], [ %102, %100 ]
  %109 = phi i32 [ %71, %74 ], [ %102, %100 ]
  %110 = phi float [ %72, %74 ], [ %101, %100 ]
  %111 = phi i32 [ %59, %74 ], [ %103, %100 ]
  br i1 %69, label %185, label %112

112:                                              ; preds = %106, %180
  %113 = phi i32 [ %182, %180 ], [ %109, %106 ]
  %114 = phi float [ %181, %180 ], [ %110, %106 ]
  %115 = phi i32 [ %183, %180 ], [ %111, %106 ]
  %116 = add nsw i32 %75, %115
  %117 = add nsw i32 %79, %116
  %118 = icmp sgt i32 %116, -1
  br i1 %118, label %119, label %129

119:                                              ; preds = %112
  %120 = icmp sle i32 %116, %17
  %121 = select i1 %120, i1 %80, i1 false
  %122 = select i1 %121, i1 %81, i1 false
  br i1 %122, label %123, label %129

123:                                              ; preds = %119
  %124 = add nsw i32 %113, 1
  %125 = sext i32 %117 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %8, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !16, !amdgpu.noclobber !14
  %128 = fadd contract float %114, %127
  br label %129

129:                                              ; preds = %112, %123, %119
  %130 = phi float [ %128, %123 ], [ %114, %119 ], [ %114, %112 ]
  %131 = phi i32 [ %124, %123 ], [ %113, %119 ], [ %113, %112 ]
  %132 = add i32 %115, 1
  %133 = add nsw i32 %75, %132
  %134 = add nsw i32 %79, %133
  %135 = icmp sgt i32 %133, -1
  br i1 %135, label %136, label %146

136:                                              ; preds = %129
  %137 = icmp sle i32 %133, %17
  %138 = select i1 %137, i1 %80, i1 false
  %139 = select i1 %138, i1 %81, i1 false
  br i1 %139, label %140, label %146

140:                                              ; preds = %136
  %141 = add nsw i32 %131, 1
  %142 = sext i32 %134 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %8, i64 %142
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !16, !amdgpu.noclobber !14
  %145 = fadd contract float %130, %144
  br label %146

146:                                              ; preds = %140, %136, %129
  %147 = phi float [ %145, %140 ], [ %130, %136 ], [ %130, %129 ]
  %148 = phi i32 [ %141, %140 ], [ %131, %136 ], [ %131, %129 ]
  %149 = add i32 %115, 2
  %150 = add nsw i32 %75, %149
  %151 = add nsw i32 %79, %150
  %152 = icmp sgt i32 %150, -1
  br i1 %152, label %153, label %163

153:                                              ; preds = %146
  %154 = icmp sle i32 %150, %17
  %155 = select i1 %154, i1 %80, i1 false
  %156 = select i1 %155, i1 %81, i1 false
  br i1 %156, label %157, label %163

157:                                              ; preds = %153
  %158 = add nsw i32 %148, 1
  %159 = sext i32 %151 to i64
  %160 = getelementptr inbounds float, float addrspace(1)* %8, i64 %159
  %161 = load float, float addrspace(1)* %160, align 4, !tbaa !16, !amdgpu.noclobber !14
  %162 = fadd contract float %147, %161
  br label %163

163:                                              ; preds = %157, %153, %146
  %164 = phi float [ %162, %157 ], [ %147, %153 ], [ %147, %146 ]
  %165 = phi i32 [ %158, %157 ], [ %148, %153 ], [ %148, %146 ]
  %166 = add i32 %115, 3
  %167 = add nsw i32 %75, %166
  %168 = add nsw i32 %79, %167
  %169 = icmp sgt i32 %167, -1
  br i1 %169, label %170, label %180

170:                                              ; preds = %163
  %171 = icmp sle i32 %167, %17
  %172 = select i1 %171, i1 %80, i1 false
  %173 = select i1 %172, i1 %81, i1 false
  br i1 %173, label %174, label %180

174:                                              ; preds = %170
  %175 = add nsw i32 %165, 1
  %176 = sext i32 %168 to i64
  %177 = getelementptr inbounds float, float addrspace(1)* %8, i64 %176
  %178 = load float, float addrspace(1)* %177, align 4, !tbaa !16, !amdgpu.noclobber !14
  %179 = fadd contract float %164, %178
  br label %180

180:                                              ; preds = %174, %170, %163
  %181 = phi float [ %179, %174 ], [ %164, %170 ], [ %164, %163 ]
  %182 = phi i32 [ %175, %174 ], [ %165, %170 ], [ %165, %163 ]
  %183 = add i32 %115, 4
  %184 = icmp eq i32 %166, %64
  br i1 %184, label %185, label %112, !llvm.loop !22

185:                                              ; preds = %106, %180, %70
  %186 = phi float [ %72, %70 ], [ %107, %106 ], [ %181, %180 ]
  %187 = phi i32 [ %71, %70 ], [ %108, %106 ], [ %182, %180 ]
  %188 = add i32 %73, 1
  %189 = icmp eq i32 %73, %21
  br i1 %189, label %190, label %70, !llvm.loop !24

190:                                              ; preds = %185, %43
  %191 = phi float [ 0.000000e+00, %43 ], [ %186, %185 ]
  %192 = phi i32 [ 0, %43 ], [ %187, %185 ]
  %193 = icmp sgt i32 %192, 0
  br i1 %193, label %194, label %201

194:                                              ; preds = %190
  %195 = sitofp i32 %192 to float
  %196 = fdiv contract float %191, %195
  %197 = sext i32 %41 to i64
  %198 = getelementptr inbounds float, float addrspace(1)* %9, i64 %197
  %199 = load float, float addrspace(1)* %198, align 4, !tbaa !16, !amdgpu.noclobber !14
  %200 = fadd contract float %196, %199
  store float %200, float addrspace(1)* %198, align 4, !tbaa !16
  br label %201

201:                                              ; preds = %190, %194, %10
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

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.abs.i32(i32, i1 immarg) #2

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
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !23}
