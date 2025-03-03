; ModuleID = '../data/hip_kernels/1187/14/main.cu'
source_filename = "../data/hip_kernels/1187/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20sga_up_data_backwardiPKfPfiiiiS1_(i32 %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2, i32 %3, i32 %4, i32 %5, i32 %6, float addrspace(1)* nocapture %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = icmp slt i32 %17, %0
  br i1 %18, label %19, label %224

19:                                               ; preds = %8
  %20 = mul nsw i32 %4, %3
  %21 = freeze i32 %17
  %22 = freeze i32 %4
  %23 = sdiv i32 %21, %22
  %24 = mul nsw i32 %23, %20
  %25 = mul nsw i32 %24, %5
  %26 = mul i32 %23, %22
  %27 = sub i32 %21, %26
  %28 = add nsw i32 %25, %27
  %29 = mul nsw i32 %24, %6
  %30 = add nsw i32 %29, %27
  %31 = icmp sgt i32 %3, 0
  br i1 %31, label %32, label %224

32:                                               ; preds = %19
  %33 = icmp sgt i32 %5, 0
  %34 = sub i32 %20, %4
  %35 = shl nsw i32 %4, 1
  %36 = shl i32 %34, 1
  %37 = mul nsw i32 %20, 3
  %38 = sub i32 %37, %4
  %39 = add i32 %20, %4
  %40 = shl nsw i32 %20, 2
  %41 = sub i32 %40, %4
  br label %52

42:                                               ; preds = %74
  br i1 %31, label %43, label %224

43:                                               ; preds = %42
  %44 = mul nsw i32 %20, 3
  %45 = add nsw i32 %5, -1
  %46 = mul nsw i32 %45, %20
  %47 = shl nsw i32 %20, 2
  %48 = and i32 %3, 1
  %49 = icmp eq i32 %3, 1
  br i1 %49, label %194, label %50

50:                                               ; preds = %43
  %51 = and i32 %3, -2
  br label %135

52:                                               ; preds = %32, %74
  %53 = phi i32 [ 0, %32 ], [ %75, %74 ]
  %54 = mul nsw i32 %53, %4
  %55 = add nsw i32 %54, %30
  br i1 %33, label %56, label %74

56:                                               ; preds = %52
  %57 = add i32 %54, %28
  %58 = icmp eq i32 %53, 0
  %59 = add i32 %34, %55
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %1, i64 %60
  %62 = icmp ugt i32 %53, 1
  %63 = add i32 %36, %55
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %1, i64 %64
  %66 = add i32 %38, %55
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %1, i64 %67
  %69 = add i32 %41, %55
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %1, i64 %70
  %72 = sext i32 %55 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %1, i64 %72
  br label %77

74:                                               ; preds = %127, %52
  %75 = add nuw nsw i32 %53, 1
  %76 = icmp eq i32 %75, %3
  br i1 %76, label %42, label %52, !llvm.loop !7

77:                                               ; preds = %56, %127
  %78 = phi i32 [ 0, %56 ], [ %104, %127 ]
  %79 = mul nsw i32 %78, %20
  %80 = add i32 %57, %79
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %2, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !9
  br i1 %58, label %92, label %84

84:                                               ; preds = %77
  %85 = sub nsw i32 %80, %4
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %2, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !9
  %89 = load float, float addrspace(1)* %61, align 4, !tbaa !9
  %90 = fmul contract float %88, %89
  %91 = fadd contract float %83, %90
  br label %92

92:                                               ; preds = %84, %77
  %93 = phi float [ %91, %84 ], [ %83, %77 ]
  br i1 %62, label %94, label %102

94:                                               ; preds = %92
  %95 = sub nsw i32 %80, %35
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %2, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !9
  %99 = load float, float addrspace(1)* %65, align 4, !tbaa !9
  %100 = fmul contract float %98, %99
  %101 = fadd contract float %93, %100
  br label %102

102:                                              ; preds = %94, %92
  %103 = phi float [ %101, %94 ], [ %93, %92 ]
  %104 = add nuw nsw i32 %78, 1
  %105 = icmp sge i32 %104, %5
  %106 = select i1 %58, i1 true, i1 %105
  br i1 %106, label %115, label %107

107:                                              ; preds = %102
  %108 = add i32 %34, %80
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %2, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !9
  %112 = load float, float addrspace(1)* %68, align 4, !tbaa !9
  %113 = fmul contract float %111, %112
  %114 = fadd contract float %103, %113
  br label %115

115:                                              ; preds = %107, %102
  %116 = phi float [ %114, %107 ], [ %103, %102 ]
  %117 = icmp eq i32 %78, 0
  %118 = select i1 %58, i1 true, i1 %117
  br i1 %118, label %127, label %119

119:                                              ; preds = %115
  %120 = sub i32 %80, %39
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %2, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !9
  %124 = load float, float addrspace(1)* %71, align 4, !tbaa !9
  %125 = fmul contract float %123, %124
  %126 = fadd contract float %116, %125
  br label %127

127:                                              ; preds = %119, %115
  %128 = phi float [ %126, %119 ], [ %116, %115 ]
  store float %128, float addrspace(1)* %82, align 4, !tbaa !9
  %129 = load float, float addrspace(1)* %73, align 4, !tbaa !9
  %130 = fmul contract float %128, %129
  %131 = getelementptr inbounds float, float addrspace(1)* %7, i64 %81
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !9
  %133 = fadd contract float %132, %130
  store float %133, float addrspace(1)* %131, align 4, !tbaa !9
  %134 = icmp eq i32 %104, %5
  br i1 %134, label %74, label %77, !llvm.loop !13

135:                                              ; preds = %135, %50
  %136 = phi i32 [ 0, %50 ], [ %191, %135 ]
  %137 = phi i32 [ 0, %50 ], [ %192, %135 ]
  %138 = mul nsw i32 %136, %4
  %139 = add nsw i32 %138, %30
  %140 = add nsw i32 %138, %28
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %2, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !9
  %144 = add nsw i32 %139, %44
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds float, float addrspace(1)* %1, i64 %145
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !9
  %148 = fmul contract float %143, %147
  %149 = getelementptr inbounds float, float addrspace(1)* %7, i64 %141
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !9
  %151 = fadd contract float %150, %148
  store float %151, float addrspace(1)* %149, align 4, !tbaa !9
  %152 = add nsw i32 %140, %46
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds float, float addrspace(1)* %2, i64 %153
  %155 = load float, float addrspace(1)* %154, align 4, !tbaa !9
  %156 = add nsw i32 %139, %47
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds float, float addrspace(1)* %1, i64 %157
  %159 = load float, float addrspace(1)* %158, align 4, !tbaa !9
  %160 = fmul contract float %155, %159
  %161 = getelementptr inbounds float, float addrspace(1)* %7, i64 %153
  %162 = load float, float addrspace(1)* %161, align 4, !tbaa !9
  %163 = fadd contract float %162, %160
  store float %163, float addrspace(1)* %161, align 4, !tbaa !9
  %164 = or i32 %136, 1
  %165 = mul nsw i32 %164, %4
  %166 = add nsw i32 %165, %30
  %167 = add nsw i32 %165, %28
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds float, float addrspace(1)* %2, i64 %168
  %170 = load float, float addrspace(1)* %169, align 4, !tbaa !9
  %171 = add nsw i32 %166, %44
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds float, float addrspace(1)* %1, i64 %172
  %174 = load float, float addrspace(1)* %173, align 4, !tbaa !9
  %175 = fmul contract float %170, %174
  %176 = getelementptr inbounds float, float addrspace(1)* %7, i64 %168
  %177 = load float, float addrspace(1)* %176, align 4, !tbaa !9
  %178 = fadd contract float %177, %175
  store float %178, float addrspace(1)* %176, align 4, !tbaa !9
  %179 = add nsw i32 %167, %46
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds float, float addrspace(1)* %2, i64 %180
  %182 = load float, float addrspace(1)* %181, align 4, !tbaa !9
  %183 = add nsw i32 %166, %47
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds float, float addrspace(1)* %1, i64 %184
  %186 = load float, float addrspace(1)* %185, align 4, !tbaa !9
  %187 = fmul contract float %182, %186
  %188 = getelementptr inbounds float, float addrspace(1)* %7, i64 %180
  %189 = load float, float addrspace(1)* %188, align 4, !tbaa !9
  %190 = fadd contract float %189, %187
  store float %190, float addrspace(1)* %188, align 4, !tbaa !9
  %191 = add nuw nsw i32 %136, 2
  %192 = add i32 %137, 2
  %193 = icmp eq i32 %192, %51
  br i1 %193, label %194, label %135, !llvm.loop !14

194:                                              ; preds = %135, %43
  %195 = phi i32 [ 0, %43 ], [ %191, %135 ]
  %196 = icmp eq i32 %48, 0
  br i1 %196, label %224, label %197

197:                                              ; preds = %194
  %198 = mul nsw i32 %195, %4
  %199 = add nsw i32 %198, %30
  %200 = add nsw i32 %198, %28
  %201 = sext i32 %200 to i64
  %202 = getelementptr inbounds float, float addrspace(1)* %2, i64 %201
  %203 = load float, float addrspace(1)* %202, align 4, !tbaa !9
  %204 = add nsw i32 %199, %44
  %205 = sext i32 %204 to i64
  %206 = getelementptr inbounds float, float addrspace(1)* %1, i64 %205
  %207 = load float, float addrspace(1)* %206, align 4, !tbaa !9
  %208 = fmul contract float %203, %207
  %209 = getelementptr inbounds float, float addrspace(1)* %7, i64 %201
  %210 = load float, float addrspace(1)* %209, align 4, !tbaa !9
  %211 = fadd contract float %210, %208
  store float %211, float addrspace(1)* %209, align 4, !tbaa !9
  %212 = add nsw i32 %200, %46
  %213 = sext i32 %212 to i64
  %214 = getelementptr inbounds float, float addrspace(1)* %2, i64 %213
  %215 = load float, float addrspace(1)* %214, align 4, !tbaa !9
  %216 = add nsw i32 %199, %47
  %217 = sext i32 %216 to i64
  %218 = getelementptr inbounds float, float addrspace(1)* %1, i64 %217
  %219 = load float, float addrspace(1)* %218, align 4, !tbaa !9
  %220 = fmul contract float %215, %219
  %221 = getelementptr inbounds float, float addrspace(1)* %7, i64 %213
  %222 = load float, float addrspace(1)* %221, align 4, !tbaa !9
  %223 = fadd contract float %222, %220
  store float %223, float addrspace(1)* %221, align 4, !tbaa !9
  br label %224

224:                                              ; preds = %197, %194, %19, %42, %8
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
!6 = !{i32 0, i32 1024}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!10, !10, i64 0}
!10 = !{!"float", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C++ TBAA"}
!13 = distinct !{!13, !8}
!14 = distinct !{!14, !8}
