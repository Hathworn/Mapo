; ModuleID = '../data/hip_kernels/17576/0/main.cu'
source_filename = "../data/hip_kernels/17576/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ9dist_calcPfPiS0_S0_iiE5x_ref = internal unnamed_addr addrspace(3) global float undef, align 4
@_ZZ9dist_calcPfPiS0_S0_iiE5y_ref = internal unnamed_addr addrspace(3) global float undef, align 4
@_ZZ9dist_calcPfPiS0_S0_iiE5z_ref = internal unnamed_addr addrspace(3) global float undef, align 4
@_ZZ9dist_calcPfPiS0_S0_iiE3idz = internal unnamed_addr addrspace(3) global i32 undef, align 4
@_ZZ9dist_calcPfPiS0_S0_iiE4temp = internal unnamed_addr addrspace(3) global [2048 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9dist_calcPfPiS0_S0_ii(float addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1, i32 addrspace(1)* nocapture %2, i32 addrspace(1)* nocapture writeonly %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = icmp slt i32 %7, %4
  br i1 %8, label %9, label %30

9:                                                ; preds = %6
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = icmp eq i32 %10, 0
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 12
  %14 = bitcast i8 addrspace(4)* %13 to i32 addrspace(4)*
  %15 = load i32, i32 addrspace(4)* %14, align 4, !tbaa !5
  %16 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !14, !invariant.load !15
  %19 = zext i16 %18 to i32
  %20 = udiv i32 %15, %19
  %21 = mul i32 %20, %19
  %22 = icmp ugt i32 %15, %21
  %23 = zext i1 %22 to i32
  %24 = add i32 %20, %23
  %25 = icmp slt i32 %10, %4
  %26 = icmp slt i32 %10, %5
  %27 = shl nuw nsw i32 %19, 1
  %28 = add nsw i32 %27, -1
  %29 = getelementptr inbounds [2048 x i32], [2048 x i32] addrspace(3)* @_ZZ9dist_calcPfPiS0_S0_iiE4temp, i32 0, i32 %28
  br label %31

30:                                               ; preds = %94, %6
  ret void

31:                                               ; preds = %9, %94
  %32 = phi i32 [ %7, %9 ], [ %95, %94 ]
  br i1 %11, label %33, label %46

33:                                               ; preds = %31
  %34 = mul nsw i32 %32, 3
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %0, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !16
  store float %37, float addrspace(3)* @_ZZ9dist_calcPfPiS0_S0_iiE5x_ref, align 4, !tbaa !16
  %38 = add nsw i32 %34, 1
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %0, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !16
  store float %41, float addrspace(3)* @_ZZ9dist_calcPfPiS0_S0_iiE5y_ref, align 4, !tbaa !16
  %42 = add nsw i32 %34, 2
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %0, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !16
  store float %45, float addrspace(3)* @_ZZ9dist_calcPfPiS0_S0_iiE5z_ref, align 4, !tbaa !16
  br label %46

46:                                               ; preds = %33, %31
  %47 = urem i32 %32, %24
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %25, label %48, label %56

48:                                               ; preds = %46
  %49 = load float, float addrspace(3)* @_ZZ9dist_calcPfPiS0_S0_iiE5x_ref, align 4, !tbaa !16
  %50 = load float, float addrspace(3)* @_ZZ9dist_calcPfPiS0_S0_iiE5y_ref, align 4, !tbaa !16
  %51 = load float, float addrspace(3)* @_ZZ9dist_calcPfPiS0_S0_iiE5z_ref, align 4, !tbaa !16
  %52 = mul nsw i32 %47, %5
  %53 = add nsw i32 %32, %52
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %54
  br label %62

56:                                               ; preds = %91, %46
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  store i32 0, i32 addrspace(3)* @_ZZ9dist_calcPfPiS0_S0_iiE3idz, align 4, !tbaa !20
  br i1 %26, label %57, label %94

57:                                               ; preds = %56
  %58 = mul nsw i32 %47, %5
  %59 = sext i32 %32 to i64
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %59
  %61 = shl nsw i32 %32, 10
  br label %97

62:                                               ; preds = %48, %91
  %63 = phi i32 [ %10, %48 ], [ %92, %91 ]
  %64 = mul nsw i32 %63, 3
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %0, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !16
  %68 = fsub contract float %67, %49
  %69 = fmul contract float %68, %68
  %70 = add nsw i32 %64, 1
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %0, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !16
  %74 = fsub contract float %73, %50
  %75 = fmul contract float %74, %74
  %76 = fadd contract float %69, %75
  %77 = add nsw i32 %64, 2
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %0, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !16
  %81 = fsub contract float %80, %51
  %82 = fmul contract float %81, %81
  %83 = fadd contract float %76, %82
  %84 = fcmp contract olt float %83, 3.400000e+01
  %85 = add nsw i32 %63, %52
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %86
  %88 = zext i1 %84 to i32
  store i32 %88, i32 addrspace(1)* %87, align 4, !tbaa !20
  %89 = icmp eq i32 %32, %63
  br i1 %89, label %90, label %91

90:                                               ; preds = %62
  store i32 0, i32 addrspace(1)* %55, align 4, !tbaa !20
  br label %91

91:                                               ; preds = %90, %62
  %92 = add i32 %63, %19
  %93 = icmp slt i32 %92, %4
  br i1 %93, label %62, label %56, !llvm.loop !22

94:                                               ; preds = %189, %56
  %95 = add i32 %24, %32
  %96 = icmp slt i32 %95, %4
  br i1 %96, label %31, label %30, !llvm.loop !24

97:                                               ; preds = %57, %189
  %98 = phi i32 [ %10, %57 ], [ %191, %189 ]
  %99 = urem i32 %98, %19
  %100 = load i32, i32 addrspace(3)* @_ZZ9dist_calcPfPiS0_S0_iiE3idz, align 4, !tbaa !20
  %101 = mul i32 %100, %27
  %102 = shl nuw nsw i32 %99, 1
  %103 = add i32 %102, %58
  %104 = add i32 %103, %101
  %105 = zext i32 %104 to i64
  %106 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %105
  %107 = load i32, i32 addrspace(1)* %106, align 4, !tbaa !20
  %108 = getelementptr inbounds [2048 x i32], [2048 x i32] addrspace(3)* @_ZZ9dist_calcPfPiS0_S0_iiE4temp, i32 0, i32 %102
  store i32 %107, i32 addrspace(3)* %108, align 8, !tbaa !20
  %109 = add i32 %104, 1
  %110 = zext i32 %109 to i64
  %111 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %110
  %112 = load i32, i32 addrspace(1)* %111, align 4, !tbaa !20
  %113 = add nuw nsw i32 %102, 1
  %114 = getelementptr inbounds [2048 x i32], [2048 x i32] addrspace(3)* @_ZZ9dist_calcPfPiS0_S0_iiE4temp, i32 0, i32 %113
  store i32 %112, i32 addrspace(3)* %114, align 4, !tbaa !20
  %115 = add nuw nsw i32 %102, 2
  br label %119

116:                                              ; preds = %133
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %117 = load i32, i32 addrspace(1)* %60, align 4, !tbaa !20
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %118 = icmp eq i32 %99, 0
  br i1 %118, label %137, label %141

119:                                              ; preds = %97, %133
  %120 = phi i32 [ %19, %97 ], [ %135, %133 ]
  %121 = phi i32 [ 1, %97 ], [ %134, %133 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %122 = icmp ult i32 %99, %120
  br i1 %122, label %123, label %133

123:                                              ; preds = %119
  %124 = mul nsw i32 %121, %113
  %125 = add nsw i32 %124, -1
  %126 = mul nsw i32 %121, %115
  %127 = add nsw i32 %126, -1
  %128 = getelementptr inbounds [2048 x i32], [2048 x i32] addrspace(3)* @_ZZ9dist_calcPfPiS0_S0_iiE4temp, i32 0, i32 %125
  %129 = load i32, i32 addrspace(3)* %128, align 4, !tbaa !20
  %130 = getelementptr inbounds [2048 x i32], [2048 x i32] addrspace(3)* @_ZZ9dist_calcPfPiS0_S0_iiE4temp, i32 0, i32 %127
  %131 = load i32, i32 addrspace(3)* %130, align 4, !tbaa !20
  %132 = add nsw i32 %131, %129
  store i32 %132, i32 addrspace(3)* %130, align 4, !tbaa !20
  br label %133

133:                                              ; preds = %123, %119
  %134 = shl nsw i32 %121, 1
  %135 = lshr i32 %120, 1
  %136 = icmp ult i32 %120, 2
  br i1 %136, label %116, label %119, !llvm.loop !25

137:                                              ; preds = %116
  %138 = load i32, i32 addrspace(3)* %29, align 4, !tbaa !20
  %139 = load i32, i32 addrspace(1)* %60, align 4, !tbaa !20
  %140 = add nsw i32 %139, %138
  store i32 %140, i32 addrspace(1)* %60, align 4, !tbaa !20
  store i32 0, i32 addrspace(3)* %29, align 4, !tbaa !20
  br label %141

141:                                              ; preds = %137, %116
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %150

142:                                              ; preds = %166
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %143 = load i32, i32 addrspace(3)* @_ZZ9dist_calcPfPiS0_S0_iiE3idz, align 4, !tbaa !20
  %144 = mul i32 %143, %27
  %145 = add i32 %103, %144
  %146 = zext i32 %145 to i64
  %147 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %146
  %148 = load i32, i32 addrspace(1)* %147, align 4, !tbaa !20
  %149 = icmp eq i32 %148, 1
  br i1 %149, label %169, label %176

150:                                              ; preds = %141, %166
  %151 = phi i32 [ 1, %141 ], [ %167, %166 ]
  %152 = phi i32 [ %134, %141 ], [ %153, %166 ]
  %153 = lshr i32 %152, 1
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %154 = icmp slt i32 %99, %151
  br i1 %154, label %155, label %166

155:                                              ; preds = %150
  %156 = mul nsw i32 %153, %113
  %157 = add nsw i32 %156, -1
  %158 = mul nsw i32 %153, %115
  %159 = add nsw i32 %158, -1
  %160 = getelementptr inbounds [2048 x i32], [2048 x i32] addrspace(3)* @_ZZ9dist_calcPfPiS0_S0_iiE4temp, i32 0, i32 %157
  %161 = load i32, i32 addrspace(3)* %160, align 4, !tbaa !20
  %162 = getelementptr inbounds [2048 x i32], [2048 x i32] addrspace(3)* @_ZZ9dist_calcPfPiS0_S0_iiE4temp, i32 0, i32 %159
  %163 = load i32, i32 addrspace(3)* %162, align 4, !tbaa !20
  store i32 %163, i32 addrspace(3)* %160, align 4, !tbaa !20
  %164 = load i32, i32 addrspace(3)* %162, align 4, !tbaa !20
  %165 = add nsw i32 %164, %161
  store i32 %165, i32 addrspace(3)* %162, align 4, !tbaa !20
  br label %166

166:                                              ; preds = %150, %155
  %167 = shl nsw i32 %151, 1
  %168 = icmp ult i32 %167, %27
  br i1 %168, label %150, label %142, !llvm.loop !26

169:                                              ; preds = %142
  %170 = add i32 %144, %102
  %171 = load i32, i32 addrspace(3)* %108, align 8, !tbaa !20
  %172 = add i32 %117, %61
  %173 = add i32 %172, %171
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %174
  store i32 %170, i32 addrspace(1)* %175, align 4, !tbaa !20
  br label %176

176:                                              ; preds = %169, %142
  %177 = add i32 %145, 1
  %178 = zext i32 %177 to i64
  %179 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %178
  %180 = load i32, i32 addrspace(1)* %179, align 4, !tbaa !20
  %181 = icmp eq i32 %180, 1
  br i1 %181, label %182, label %189

182:                                              ; preds = %176
  %183 = add i32 %144, %113
  %184 = load i32, i32 addrspace(3)* %114, align 4, !tbaa !20
  %185 = add i32 %117, %61
  %186 = add i32 %185, %184
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %187
  store i32 %183, i32 addrspace(1)* %188, align 4, !tbaa !20
  br label %189

189:                                              ; preds = %182, %176
  %190 = add nsw i32 %143, 1
  store i32 %190, i32 addrspace(3)* @_ZZ9dist_calcPfPiS0_S0_iiE3idz, align 4, !tbaa !20
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %191 = add i32 %98, %27
  %192 = icmp slt i32 %191, %5
  br i1 %192, label %97, label %94, !llvm.loop !27
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !10, i64 12}
!6 = !{!"hsa_kernel_dispatch_packet_s", !7, i64 0, !7, i64 2, !7, i64 4, !7, i64 6, !7, i64 8, !7, i64 10, !10, i64 12, !10, i64 16, !10, i64 20, !10, i64 24, !10, i64 28, !11, i64 32, !12, i64 40, !11, i64 48, !13, i64 56}
!7 = !{!"short", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"int", !8, i64 0}
!11 = !{!"long", !8, i64 0}
!12 = !{!"any pointer", !8, i64 0}
!13 = !{!"hsa_signal_s", !11, i64 0}
!14 = !{i16 1, i16 1025}
!15 = !{}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"int", !18, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !23}
!25 = distinct !{!25, !23}
!26 = distinct !{!26, !23}
!27 = distinct !{!27, !23}
