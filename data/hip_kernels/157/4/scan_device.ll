; ModuleID = '../data/hip_kernels/157/4/main.cu'
source_filename = "../data/hip_kernels/157/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ4scanPfS_iE10scan_array = internal unnamed_addr addrspace(3) global [128 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z4scanPfS_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %9
  %12 = add i32 %11, %4
  %13 = icmp slt i32 %12, %2
  br i1 %13, label %14, label %18

14:                                               ; preds = %3
  %15 = sext i32 %12 to i64
  %16 = getelementptr inbounds float, float addrspace(1)* %0, i64 %15
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %18

18:                                               ; preds = %3, %14
  %19 = phi float [ %17, %14 ], [ 0.000000e+00, %3 ]
  %20 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ4scanPfS_iE10scan_array, i32 0, i32 %4
  store float %19, float addrspace(3)* %20, align 4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %21 = shl nuw nsw i32 %4, 1
  %22 = add nuw nsw i32 %21, 2
  %23 = add nuw nsw i32 %21, 1
  %24 = icmp ult i32 %4, 64
  br i1 %24, label %25, label %31

25:                                               ; preds = %18
  %26 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ4scanPfS_iE10scan_array, i32 0, i32 %21
  %27 = load float, float addrspace(3)* %26, align 8, !tbaa !7
  %28 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ4scanPfS_iE10scan_array, i32 0, i32 %23
  %29 = load float, float addrspace(3)* %28, align 4, !tbaa !7
  %30 = fadd contract float %27, %29
  store float %30, float addrspace(3)* %28, align 4, !tbaa !7
  br label %31

31:                                               ; preds = %25, %18
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %32 = shl nuw nsw i32 %22, 1
  %33 = add nsw i32 %32, -1
  %34 = icmp ult i32 %4, 32
  br i1 %34, label %35, label %42

35:                                               ; preds = %31
  %36 = add nsw i32 %32, -3
  %37 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ4scanPfS_iE10scan_array, i32 0, i32 %36
  %38 = load float, float addrspace(3)* %37, align 4, !tbaa !7
  %39 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ4scanPfS_iE10scan_array, i32 0, i32 %33
  %40 = load float, float addrspace(3)* %39, align 4, !tbaa !7
  %41 = fadd contract float %38, %40
  store float %41, float addrspace(3)* %39, align 4, !tbaa !7
  br label %42

42:                                               ; preds = %35, %31
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %43 = shl nuw nsw i32 %22, 2
  %44 = add nsw i32 %43, -1
  %45 = icmp ult i32 %4, 16
  br i1 %45, label %46, label %53

46:                                               ; preds = %42
  %47 = add nsw i32 %43, -5
  %48 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ4scanPfS_iE10scan_array, i32 0, i32 %47
  %49 = load float, float addrspace(3)* %48, align 4, !tbaa !7
  %50 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ4scanPfS_iE10scan_array, i32 0, i32 %44
  %51 = load float, float addrspace(3)* %50, align 4, !tbaa !7
  %52 = fadd contract float %49, %51
  store float %52, float addrspace(3)* %50, align 4, !tbaa !7
  br label %53

53:                                               ; preds = %46, %42
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %54 = shl nuw nsw i32 %22, 3
  %55 = add nsw i32 %54, -1
  %56 = icmp ult i32 %4, 8
  br i1 %56, label %57, label %64

57:                                               ; preds = %53
  %58 = add nsw i32 %54, -9
  %59 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ4scanPfS_iE10scan_array, i32 0, i32 %58
  %60 = load float, float addrspace(3)* %59, align 4, !tbaa !7
  %61 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ4scanPfS_iE10scan_array, i32 0, i32 %55
  %62 = load float, float addrspace(3)* %61, align 4, !tbaa !7
  %63 = fadd contract float %60, %62
  store float %63, float addrspace(3)* %61, align 4, !tbaa !7
  br label %64

64:                                               ; preds = %57, %53
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %65 = shl nuw nsw i32 %22, 4
  %66 = add nsw i32 %65, -1
  %67 = icmp ult i32 %4, 4
  br i1 %67, label %68, label %75

68:                                               ; preds = %64
  %69 = add nsw i32 %65, -17
  %70 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ4scanPfS_iE10scan_array, i32 0, i32 %69
  %71 = load float, float addrspace(3)* %70, align 4, !tbaa !7
  %72 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ4scanPfS_iE10scan_array, i32 0, i32 %66
  %73 = load float, float addrspace(3)* %72, align 4, !tbaa !7
  %74 = fadd contract float %71, %73
  store float %74, float addrspace(3)* %72, align 4, !tbaa !7
  br label %75

75:                                               ; preds = %68, %64
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %76 = shl nuw nsw i32 %22, 5
  %77 = add nsw i32 %76, -1
  %78 = icmp ult i32 %4, 2
  br i1 %78, label %79, label %86

79:                                               ; preds = %75
  %80 = add nsw i32 %76, -33
  %81 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ4scanPfS_iE10scan_array, i32 0, i32 %80
  %82 = load float, float addrspace(3)* %81, align 4, !tbaa !7
  %83 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ4scanPfS_iE10scan_array, i32 0, i32 %77
  %84 = load float, float addrspace(3)* %83, align 4, !tbaa !7
  %85 = fadd contract float %82, %84
  store float %85, float addrspace(3)* %83, align 4, !tbaa !7
  br label %86

86:                                               ; preds = %79, %75
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %87 = shl nuw nsw i32 %22, 6
  %88 = icmp eq i32 %4, 0
  br i1 %88, label %89, label %97

89:                                               ; preds = %86
  %90 = add nsw i32 %87, -1
  %91 = add nsw i32 %87, -65
  %92 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ4scanPfS_iE10scan_array, i32 0, i32 %91
  %93 = load float, float addrspace(3)* %92, align 4, !tbaa !7
  %94 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ4scanPfS_iE10scan_array, i32 0, i32 %90
  %95 = load float, float addrspace(3)* %94, align 4, !tbaa !7
  %96 = fadd contract float %93, %95
  store float %96, float addrspace(3)* %94, align 4, !tbaa !7
  br label %97

97:                                               ; preds = %89, %86
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %98 = icmp eq i32 %4, 0
  br i1 %98, label %99, label %106

99:                                               ; preds = %97
  %100 = add nuw nsw i32 %76, 31
  %101 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ4scanPfS_iE10scan_array, i32 0, i32 %77
  %102 = load float, float addrspace(3)* %101, align 4, !tbaa !7
  %103 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ4scanPfS_iE10scan_array, i32 0, i32 %100
  %104 = load float, float addrspace(3)* %103, align 4, !tbaa !7
  %105 = fadd contract float %102, %104
  store float %105, float addrspace(3)* %103, align 4, !tbaa !7
  br label %106

106:                                              ; preds = %99, %97
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %107 = icmp ult i32 %4, 3
  br i1 %107, label %108, label %115

108:                                              ; preds = %106
  %109 = add nuw nsw i32 %65, 15
  %110 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ4scanPfS_iE10scan_array, i32 0, i32 %66
  %111 = load float, float addrspace(3)* %110, align 4, !tbaa !7
  %112 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ4scanPfS_iE10scan_array, i32 0, i32 %109
  %113 = load float, float addrspace(3)* %112, align 4, !tbaa !7
  %114 = fadd contract float %111, %113
  store float %114, float addrspace(3)* %112, align 4, !tbaa !7
  br label %115

115:                                              ; preds = %108, %106
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %116 = icmp ult i32 %4, 7
  br i1 %116, label %117, label %124

117:                                              ; preds = %115
  %118 = add nuw nsw i32 %54, 7
  %119 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ4scanPfS_iE10scan_array, i32 0, i32 %55
  %120 = load float, float addrspace(3)* %119, align 4, !tbaa !7
  %121 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ4scanPfS_iE10scan_array, i32 0, i32 %118
  %122 = load float, float addrspace(3)* %121, align 4, !tbaa !7
  %123 = fadd contract float %120, %122
  store float %123, float addrspace(3)* %121, align 4, !tbaa !7
  br label %124

124:                                              ; preds = %117, %115
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %125 = icmp ult i32 %4, 15
  br i1 %125, label %126, label %133

126:                                              ; preds = %124
  %127 = add nuw nsw i32 %43, 3
  %128 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ4scanPfS_iE10scan_array, i32 0, i32 %44
  %129 = load float, float addrspace(3)* %128, align 4, !tbaa !7
  %130 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ4scanPfS_iE10scan_array, i32 0, i32 %127
  %131 = load float, float addrspace(3)* %130, align 4, !tbaa !7
  %132 = fadd contract float %129, %131
  store float %132, float addrspace(3)* %130, align 4, !tbaa !7
  br label %133

133:                                              ; preds = %126, %124
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %134 = icmp ult i32 %4, 31
  br i1 %134, label %135, label %142

135:                                              ; preds = %133
  %136 = add nuw nsw i32 %32, 1
  %137 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ4scanPfS_iE10scan_array, i32 0, i32 %33
  %138 = load float, float addrspace(3)* %137, align 4, !tbaa !7
  %139 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ4scanPfS_iE10scan_array, i32 0, i32 %136
  %140 = load float, float addrspace(3)* %139, align 4, !tbaa !7
  %141 = fadd contract float %138, %140
  store float %141, float addrspace(3)* %139, align 4, !tbaa !7
  br label %142

142:                                              ; preds = %135, %133
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %143 = icmp ult i32 %4, 63
  br i1 %143, label %144, label %150

144:                                              ; preds = %142
  %145 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ4scanPfS_iE10scan_array, i32 0, i32 %23
  %146 = load float, float addrspace(3)* %145, align 4, !tbaa !7
  %147 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ4scanPfS_iE10scan_array, i32 0, i32 %22
  %148 = load float, float addrspace(3)* %147, align 8, !tbaa !7
  %149 = fadd contract float %146, %148
  store float %149, float addrspace(3)* %147, align 8, !tbaa !7
  br label %150

150:                                              ; preds = %144, %142
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %13, label %151, label %155

151:                                              ; preds = %150
  %152 = load float, float addrspace(3)* %20, align 4, !tbaa !7
  %153 = sext i32 %12 to i64
  %154 = getelementptr inbounds float, float addrspace(1)* %1, i64 %153
  store float %152, float addrspace(1)* %154, align 4, !tbaa !7
  br label %155

155:                                              ; preds = %151, %150
  %156 = icmp slt i32 %12, 128
  br i1 %156, label %157, label %179

157:                                              ; preds = %155
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %158 = icmp slt i32 %2, 128
  br i1 %158, label %179, label %159

159:                                              ; preds = %157
  %160 = lshr i32 %2, 7
  br label %161

161:                                              ; preds = %159, %176
  %162 = phi i32 [ %177, %176 ], [ 1, %159 ]
  %163 = mul i32 %162, %9
  %164 = add i32 %163, %4
  %165 = icmp ult i32 %164, %2
  br i1 %165, label %166, label %176

166:                                              ; preds = %161
  %167 = shl nsw i32 %162, 7
  %168 = add nsw i32 %167, -1
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds float, float addrspace(1)* %1, i64 %169
  %171 = load float, float addrspace(1)* %170, align 4, !tbaa !7
  %172 = zext i32 %164 to i64
  %173 = getelementptr inbounds float, float addrspace(1)* %1, i64 %172
  %174 = load float, float addrspace(1)* %173, align 4, !tbaa !7
  %175 = fadd contract float %171, %174
  store float %175, float addrspace(1)* %173, align 4, !tbaa !7
  br label %176

176:                                              ; preds = %166, %161
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %177 = add nuw nsw i32 %162, 1
  %178 = icmp eq i32 %162, %160
  br i1 %178, label %179, label %161, !llvm.loop !11

179:                                              ; preds = %176, %157, %155
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
